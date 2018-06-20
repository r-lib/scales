#' Modify standard R colour in hcl colour space.
#'
#' Transforms rgb to hcl, sets non-missing arguments and then backtransforms
#' to rgb.
#'
#' @param colour character vector of colours to be modified
#' @param h new hue
#' @param l new luminance
#' @param c new chroma
#' @param alpha alpha value.  Defaults to 1.
#' @export
#' @examples
#' col2hcl(colors())
col2hcl <- function(colour, h, c, l, alpha = 1) {
  rgb <- t(grDevices::col2rgb(colour)) / 255
  coords <- grDevices::convertColor(rgb, "sRGB", "Luv")

  # Check for correctness
  # colorspace::coords(as(RGB(rgb), "polarLUV"))

  if (missing(h)) h <- atan2(coords[, "v"], coords[, "u"]) * 180 / pi
  if (missing(c)) c <- sqrt(coords[, "u"]^2 + coords[, "v"]^2)
  if (missing(l)) l <- coords[, "L"]

  hcl_colours <- grDevices::hcl(h, c, l, alpha = alpha)
  names(hcl_colours) <- names(colour)
  hcl_colours
}

#' Mute standard colour.
#'
#' @param colour character vector of colours to modify
#' @param l new luminance
#' @param c new chroma
#' @export
#' @examples
#' muted("red")
#' muted("blue")
#' show_col(c("red", "blue", muted("red"), muted("blue")))
muted <- function(colour, l=30, c=70) col2hcl(colour, l = l, c = c)

#' Modify colour transparency.
#' Vectorised in both colour and alpha.
#'
#' @param colour colour
#' @param alpha new alpha level in \[0,1].  If alpha is `NA`,
#'   existing alpha values are preserved.
#' @export
#' @examples
#' alpha("red", 0.1)
#' alpha(colours(), 0.5)
#' alpha("red", seq(0, 1, length.out = 10))
alpha <- function(colour, alpha = NA) {
  col <- grDevices::col2rgb(colour, TRUE) / 255

  if (length(colour) != length(alpha)) {
    if (length(colour) > 1 && length(alpha) > 1) {
      stop("Only one of colour and alpha can be vectorised")
    }

    if (length(colour) > 1) {
      alpha <- rep(alpha, length.out = length(colour))
    } else if (length(alpha) > 1) {
      col <- col[, rep(1, length(alpha)), drop = FALSE]
    }
  }
  alpha[is.na(alpha)] <- col[4, ][is.na(alpha)]

  new_col <- grDevices::rgb(col[1, ], col[2, ], col[3, ], alpha)
  new_col[is.na(colour)] <- NA
  new_col
}

#' Show colours.
#'
#' A quick and dirty way to show colours in a plot.
#'
#' @param colours a character vector of colours
#' @param labels boolean, whether to show the hexadecimal representation of the colours in each tile
#' @param borders colour of the borders of the tiles; matches the `border` argument of [graphics::rect()]. The default means `par("fg")`. Use `border = NA` to omit borders.
#' @param cex_label size of printed labels, works the same as \code{cex} parameter of \code{plot()}
#' @export
#' @importFrom graphics par plot rect text
show_col <- function(colours, labels = TRUE, borders = NULL, cex_label = 1) {
  n <- length(colours)
  ncol <- ceiling(sqrt(n))
  nrow <- ceiling(n / ncol)

  colours <- c(colours, rep(NA, nrow * ncol - length(colours)))
  colours <- matrix(colours, ncol = ncol, byrow = TRUE)

  old <- par(pty = "s", mar = c(0, 0, 0, 0))
  on.exit(par(old))

  size <- max(dim(colours))
  plot(c(0, size), c(0, -size), type = "n", xlab = "", ylab = "", axes = FALSE)
  rect(col(colours) - 1, -row(colours) + 1, col(colours), -row(colours),
       col = colours, border = borders
  )
  if (labels) {
    text(col(colours) - 0.5, -row(colours) + 0.5, colours, cex = cex_label)
  }
}
