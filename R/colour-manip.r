#' Modify standard R colour in hcl colour space.
#'
#' Transforms rgb to hcl, sets non-missing arguments and then backtransforms
#' to rgb.
#'
#' @param colour character vector of colours to be modified
#' @param h Hue, `[0, 360]`
#' @param l Luminance, `[0, 100]`
#' @param c Chroma, `[0, 100]`
#' @param alpha Alpha, `[0, 1]`.
#' @export
#' @examples
#' reds <- rep("red", 6)
#' show_col(col2hcl(reds, h = seq(0, 180, length = 6)))
#' show_col(col2hcl(reds, c = seq(0, 80, length = 6)))
#' show_col(col2hcl(reds, l = seq(0, 100, length = 6)))
#' show_col(col2hcl(reds, alpha = seq(0, 1, length = 6)))
col2hcl <- function(colour, h = NULL, c = NULL, l = NULL, alpha = NULL) {
  hcl <- farver::decode_colour(colour, to = "hcl")

  if (!is.null(h)) hcl[, "h"] <- h
  if (!is.null(c)) hcl[, "c"] <- c
  if (!is.null(l)) hcl[, "l"] <- l

  farver::encode_colour(hcl, alpha, from = "hcl")
}

#' Mute standard colour
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

#' Modify colour transparency
#'
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
#' alpha(c("first" = "gold", "second" = "lightgray", "third" = "#cd7f32"), .5)
alpha <- function(colour, alpha = NA) {

  if (length(colour) != length(alpha)) {
    if (length(colour) > 1 && length(alpha) > 1) {
      stop("Only one of colour and alpha can be vectorised")
    }

    if (length(colour) > 1) {
      alpha <- rep(alpha, length.out = length(colour))
    } else {
      colour <- rep(colour, length.out = length(alpha))
    }
  }

  rgb <- farver::decode_colour(colour, alpha = TRUE)
  rgb[!is.na(alpha), 4] <- alpha[!is.na(alpha)]

  farver::encode_colour(rgb, rgb[, 4])
}

#' Show colours
#'
#' A quick and dirty way to show colours in a plot.
#'
#' @param colours a character vector of colours
#' @param labels boolean, whether to show the hexadecimal representation of the colours in each tile
#' @param borders colour of the borders of the tiles; matches the `border` argument of [graphics::rect()]. The default means `par("fg")`. Use `border = NA` to omit borders.
#' @param cex_label size of printed labels, works the same as \code{cex} parameter of \code{plot()}
#' @export
#' @importFrom graphics par plot rect text
#' @keywords internal
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
    hcl <- farver::decode_colour(colours, "rgb", "hcl")
    label_col <- ifelse(hcl[, "l"] > 50, "black", "white")

    text(col(colours) - 0.5, -row(colours) + 0.5, colours, cex = cex_label, col = label_col)
  }
}
