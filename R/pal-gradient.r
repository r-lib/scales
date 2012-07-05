#' Arbitrary colour gradient palette (continous).
#' 
#' @param colours vector of colours
#' @param values if colours should not be evenly positioned along the gradient
#'   this vector gives the position (between 0 and 1) for each colour in the
#'   \code{colours} vector. See \code{\link{rescale}} for a convience function
#'   to map an arbitrary range to between 0 and 1.
#' @param space colour space in which to calculate gradient.  "Lab" usually
#'   best unless gradient goes through white. 
#' @export
gradient_n_pal <- function(colours, values = NULL, space = "Lab") {
  ramp <- colorRamp(colours, space = space)

  function(x) {
    if (length(x) == 0) return(character())
    
    if (!is.null(values)) {
      xs <- seq(0, 1, length = length(values))      
      f <- approxfun(values, xs)
      x <- f(x)
    }
    
    nice_rgb(ramp(x))
  }
}

nice_rgb <- function(x) {
  missing <- !complete.cases(x)
  x[missing, ] <- 0

  col <- rgb(x, maxColorValue = 255)
  col[missing] <- NA
  col
}

#' Diverging colour gradient (continous).
#' 
#' @param low colour for low end of gradient.
#' @param mid colour for mid point
#' @param high colour for high end of gradient.
#' @param space colour space in which to calculate gradient.  "Lab" usually
#'   best unless gradient goes through white. 
#' @export
#' @examples
#' x <- seq(-1, 1, length = 100)
#' r <- sqrt(outer(x^2, x^2, "+"))
#' image(r, col = div_gradient_pal()(seq(0, 1, length = 12)))
#' image(r, col = div_gradient_pal()(seq(0, 1, length = 30)))
#' image(r, col = div_gradient_pal()(seq(0, 1, length = 100)))
#'
#' library(munsell)
#' image(r, col = div_gradient_pal(low = 
#'    mnsl(complement("10R 4/6", fix = TRUE)))(seq(0, 1, length = 100)))
div_gradient_pal <- function(low = mnsl("10B 4/6"), mid = mnsl("N 8/0"), high = mnsl("10R 4/6"), space = "Lab") {
  gradient_n_pal(c(low, mid, high), space = space)
}

#' Sequential colour gradient palette (continous).
#' 
#' @param low colour for low end of gradient.
#' @param high colour for high end of gradient.
#' @param space colour space in which to calculate gradient.  "Lab" usually
#'   best unless gradient goes through white. 
#' @export
#' @examples
#' x <- seq(0, 1, length = 25)
#' show_col(seq_gradient_pal()(x))
#' show_col(seq_gradient_pal("white", "black")(x))
#'
#' library(munsell)
#' show_col(seq_gradient_pal("white", mnsl("10R 4/6"))(x))
seq_gradient_pal <- function(low = mnsl("10B 4/6"), high = mnsl("10R 4/6"), space = "Lab") {
  gradient_n_pal(c(low, high), space = space)
}
