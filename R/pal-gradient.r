#' Colour gradient palette (continous).
#' 
#' @export
gradient_n_pal <- function(colours, values = NULL, space = "Lab") {
  ramp <- colorRamp(colours, space = space)

  function(x) {
    if (!is.null(values)) {
      xs <- seq(0, 1, length = length(values))      
      f <- approxfun(values, xs)
      x <- f(x)
    }
    
    rgb(ramp(x), max = 255)
  }
}

#' @examples
#' x <- seq(-1, 1, length = 100)
#' r <- sqrt(outer(x^2, x^2, "+"))
#' image(r, col = gradient_2_pal()(seq(0, 1, length = 12)))
#' image(r, col = gradient_2_pal()(seq(0, 1, length = 30)))
#' image(r, col = gradient_2_pal()(seq(0, 1, length = 100)))
#' image(r, col = gradient_2_pal(low = 
#'    mnsl(complement("10R 4/6", fix = T)))(seq(0, 1, length = 100)))
gradient_2_pal <- function(low = mnsl("10B 4/6"), mid = mnsl("N 8/0"), high = mnsl("10R 4/6"), space = "Lab") {
  gradient_n_pal(c(low, mid, high), space = space)
}

gradient_pal <- function(low = mnsl("10B 4/6"), high = mnsl("10R 4/6"), space = "Lab") {
  gradient_n_pal(c(low, high), space = space)
}
