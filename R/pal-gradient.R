#' Arbitrary colour gradient palette (continuous)
#'
#' @param colours vector of colours
#' @param values if colours should not be evenly positioned along the gradient
#'   this vector gives the position (between 0 and 1) for each colour in the
#'   `colours` vector. See [rescale()] for a convenience function
#'   to map an arbitrary range to between 0 and 1.
#' @param space colour space in which to calculate gradient. Must be "Lab" -
#'   other values are deprecated.
#' @export
pal_gradient_n <- function(colours, values = NULL, space = "Lab") {
  if (!identical(space, "Lab")) {
    lifecycle::deprecate_stop("0.3.0", "pal_gradient_n(space = 'only supports be \"Lab\"')")
  }
  ramp <- colour_ramp(colours)
  force(values)

  function(x) {
    if (length(x) == 0) {
      return(character())
    }

    if (!is.null(values)) {
      xs <- seq(0, 1, length.out = length(values))
      f <- stats::approxfun(values, xs)
      x <- f(x)
    }

    ramp(x)
  }
}

#' @export
#' @rdname pal_gradient_n
gradient_n_pal <- pal_gradient_n

#' Diverging colour gradient (continuous).
#'
#' @param low colour for low end of gradient.
#' @param mid colour for mid point
#' @param high colour for high end of gradient.
#' @inheritParams pal_gradient_n
#' @export
#' @examples
#' x <- seq(-1, 1, length.out = 100)
#' r <- sqrt(outer(x^2, x^2, "+"))
#' image(r, col = pal_div_gradient()(seq(0, 1, length.out = 12)))
#' image(r, col = pal_div_gradient()(seq(0, 1, length.out = 30)))
#' image(r, col = pal_div_gradient()(seq(0, 1, length.out = 100)))
#'
#' library(munsell)
#' pal <- pal_div_gradient(low = mnsl(complement("10R 4/6"), fix = TRUE))
#' image(r, col = pal(seq(0, 1, length.out = 100)))
#' @importFrom munsell mnsl
pal_div_gradient <- function(low = mnsl("10B 4/6"), mid = mnsl("N 8/0"), high = mnsl("10R 4/6"), space = "Lab") {
  pal_gradient_n(c(low, mid, high), space = space)
}

#' @export
#' @rdname pal_div_gradient
div_gradient_pal <- pal_div_gradient

#' Sequential colour gradient palette (continuous)
#'
#' @param low colour for low end of gradient.
#' @param high colour for high end of gradient.
#' @inheritParams pal_gradient_n
#' @export
#' @examples
#' x <- seq(0, 1, length.out = 25)
#' show_col(pal_seq_gradient()(x))
#' show_col(pal_seq_gradient("white", "black")(x))
#'
#' library(munsell)
#' show_col(pal_seq_gradient("white", mnsl("10R 4/6"))(x))
pal_seq_gradient <- function(low = mnsl("10B 4/6"), high = mnsl("10R 4/6"), space = "Lab") {
  pal_gradient_n(c(low, high), space = space)
}

#' @export
#' @rdname pal_seq_gradient
seq_gradient_pal <- pal_seq_gradient
