#' Colour gradient palette (continous).
#' 
#' @export
gradient_n_pal <- function(colours, values = NULL, space="Lab") {
  if (!is.null(values)) {
    xs <- seq(0, 1, length = length(values))      
    f <- approxfun(values, xs)
    x <- f(x)
  }

  ramp <- colorRamp(colours, space = space)
  function(x) rgb(ramp(x), max = 255)
}

gradient_2_pal <- function(low = mnsl("10B 4/6"), mid = mnsl("N 4/0"), high = mnsl("10R 4/6"), space = "Lab") {
  gradient_n_pal(c(low, mid, high), space = space)
}

# rng <- .$output_set()  - .$midpoint
# extent <- max(abs(rng))
# 
# domain <- .$input_set()
# x[x < domain[1] | x > domain[2]] <- NA
# 
# x <- x - .$midpoint
# x <- x / extent / 2 + 0.5
# 
# 
# rgb(ramp(x), max = 255)
# 

gradient_pal <- function(low = mnsl("10B 4/6"), high = mnsl("10R 4/6"), space = "Lab") {
  gradient_n_pal(c(low, high), space = space)
}
