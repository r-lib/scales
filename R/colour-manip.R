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
#' @family colour manipulation
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
#' @family colour manipulation
#' @examples
#' muted("red")
#' muted("blue")
#' show_col(c("red", "blue", muted("red"), muted("blue")))
muted <- function(colour, l = 30, c = 70) col2hcl(colour, l = l, c = c)

#' Modify colour transparency
#'
#' Vectorised in both colour and alpha.
#'
#' @param colour colour
#' @param alpha new alpha level in \[0,1].  If alpha is `NA`,
#'   existing alpha values are preserved.
#' @export
#' @family colour manipulation
#' @examples
#' alpha("red", 0.1)
#' alpha(colours(), 0.5)
#' alpha("red", seq(0, 1, length.out = 10))
#' alpha(c("first" = "gold", "second" = "lightgray", "third" = "#cd7f32"), .5)
alpha <- function(colour, alpha = NA) {
  input  <- recycle_common(colour = colour, alpha = alpha)
  colour <- input[["colour"]]
  alpha  <- input[["alpha"]]

  rgb <- farver::decode_colour(colour, alpha = TRUE)
  rgb[!is.na(alpha), 4] <- alpha[!is.na(alpha)]

  farver::encode_colour(rgb, rgb[, 4])
}

#' Show colours
#'
#' A quick and dirty way to show colours in a plot.
#'
#' @param colours A character vector of colours
#' @param labels Label each colour with its hex name?
#' @param borders Border colour for each tile. Default uses `par("fg")`.
#'    Use `border = NA` to omit borders.
#' @param cex_label Size of printed labels, as multiplier of default size.
#' @param ncol Number of columns. If not supplied, tries to be as square as
#'   possible.
#' @export
#' @importFrom graphics par plot rect text
#' @keywords internal
#' @examples
#' show_col(pal_hue()(9))
#' show_col(pal_hue()(9), borders = NA)
#'
#' show_col(pal_viridis()(16))
#' show_col(pal_viridis()(16), labels = FALSE)
show_col <- function(colours, labels = TRUE, borders = NULL, cex_label = 1,
                     ncol = NULL) {
  n <- length(colours)
  ncol <- ncol %||% ceiling(sqrt(length(colours)))
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

#' Mix colours
#'
#' Produces an interpolation of two colours.
#'
#' @param a,b A character vector of colours.
#' @param amount A numeric fraction between 0 and 1 giving the contribution of
#'   the `b` colour.
#' @param space A string giving a colour space to perform mixing operation in.
#'   Polar spaces are not recommended.
#'
#' @return A character vector of colours.
#' @family colour manipulation
#' @export
#'
#' @examples
#' col_mix("blue", "red") # purple
#' col_mix("blue", "red", amount = 1) # red
#' col_mix("blue", "red", amount = 0) # blue
#'
#' # Not recommended:
#' col_mix("blue", "red", space = "hcl") # green!
col_mix <- function(a, b, amount = 0.5, space = "rgb") {
  input <- recycle_common(a = a, b = b, amount = amount)
  if (any(input$amount < 0 | input$amount > 1)) {
    cli::cli_abort("{.arg amount} must be between (0, 1).")
  }
  a <- farver::decode_colour(input$a, alpha = TRUE, to = space)
  b <- farver::decode_colour(input$b, alpha = TRUE, to = space)
  new <- (a * (1 - amount) + b * amount)
  alpha <- new[, "alpha"]
  farver::encode_colour(new, alpha = alpha, from = space)
}

#' Colour manipulation
#'
#' These are a set of convenience functions for standard colour manipulation
#' operations.
#'
#' @param col A character vector of colours.
#' @param amount A numeric vector giving the change. The interpretation depends
#'   on the function:
#'   * `col_shift()` takes a number between -360 and 360 for shifting hues in
#'     HCL space.
#'   * `col_lighter()` and `col_darker()` take a number between -100 and 100 for
#'     adding (or subtracting) to the lightness channel in HSL space.
#'   * `col_saturate()` takes a number between -100 and 100 for adding to the
#'     saturation channel in HSL space. Negative numbers desaturate the colour.
#'
#' @details
#' `col_shift()` considers the hue channel to be periodic, so adding 180 to
#' a colour with hue 270 will result in a colour with hue 90.
#'
#' @return A vector of colours.
#' @name colour_manip
#' @family colour manipulation
#'
#' @examples
#' col_shift("red", 180) # teal
#' col_lighter("red", 50) # light red
#' col_darker("red", 50) # dark red
#' col_saturate("red", -50) # brick-red
NULL

#' @export
#' @rdname colour_manip
col_shift <- function(col, amount = 10) {
  input  <- recycle_common(col = col, amount = amount)
  new <- farver::decode_colour(input$col, alpha = TRUE, to = "hcl")
  new[, "h"] <- (new[, "h"] + input$amount) %% 360
  farver::encode_colour(new, new[, "alpha"], from = "hcl")
}

#' @export
#' @rdname colour_manip
col_lighter <- function(col, amount = 10) {
  input <- recycle_common(col = col, amount = amount)
  farver::add_to_channel(input$col, "l", input$amount, space = "hsl")
}

#' @export
#' @rdname colour_manip
col_darker <- function(col, amount = 10) {
  input <- recycle_common(col = col, amount = amount)
  farver::add_to_channel(input$col, "l", -input$amount, space = "hsl")
}

#' @export
#' @rdname colour_manip
col_saturate <- function(col, amount = 10) {
  input <- recycle_common(col = col, amount = amount)
  farver::add_to_channel(input$col, "s", input$amount, space = "hsl")
}
