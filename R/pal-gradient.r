#' Arbitrary colour gradient palette (continous).
#'
#' @param colours vector of colours
#' @param values if colours should not be evenly positioned along the gradient
#'   this vector gives the position (between 0 and 1) for each colour in the
#'   \code{colours} vector. See \code{\link{rescale}} for a convience function
#'   to map an arbitrary range to between 0 and 1.
#' @param space colour space in which to calculate gradient. Must be "Lab" -
#'   other values are deprecated.
#' @export
gradient_n_pal <- function(colours, values = NULL, space = "Lab") {
  if (!identical(space, "Lab")) {
    warning("Non Lab interpolation is deprecated", call. = FALSE)
  }
  ramp <- colour_ramp(colours)

  function(x) {
    if (length(x) == 0) return(character())

    if (!is.null(values)) {
      xs <- seq(0, 1, length.out = length(values))
      f <- stats::approxfun(values, xs)
      x <- f(x)
    }

    ramp(x)
  }
}

#' Diverging colour gradient (continous).
#'
#' @param low colour for low end of gradient.
#' @param mid colour for mid point
#' @param high colour for high end of gradient.
#' @inheritParams gradient_n_pal
#' @export
#' @examples
#' x <- seq(-1, 1, length.out = 100)
#' r <- sqrt(outer(x^2, x^2, "+"))
#' image(r, col = div_gradient_pal()(seq(0, 1, length.out = 12)))
#' image(r, col = div_gradient_pal()(seq(0, 1, length.out = 30)))
#' image(r, col = div_gradient_pal()(seq(0, 1, length.out = 100)))
#'
#' library(munsell)
#' image(r, col = div_gradient_pal(low =
#'    mnsl(complement("10R 4/6", fix = TRUE)))(seq(0, 1, length = 100)))
#' @importFrom munsell mnsl
div_gradient_pal <- function(low = mnsl("10B 4/6"), mid = mnsl("N 8/0"), high = mnsl("10R 4/6"), space = "Lab") {
  gradient_n_pal(c(low, mid, high), space = space)
}

#' Sequential colour gradient palette (continous).
#'
#' @param low colour for low end of gradient.
#' @param high colour for high end of gradient.
#' @inheritParams gradient_n_pal
#' @export
#' @examples
#' x <- seq(0, 1, length.out = 25)
#' show_col(seq_gradient_pal()(x))
#' show_col(seq_gradient_pal("white", "black")(x))
#'
#' library(munsell)
#' show_col(seq_gradient_pal("white", mnsl("10R 4/6"))(x))
seq_gradient_pal <- function(low = mnsl("10B 4/6"), high = mnsl("10R 4/6"), space = "Lab") {
  gradient_n_pal(c(low, high), space = space)
}
