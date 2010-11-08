gradient_n_palette <- function(colours, values = NULL, space="Lab") {
  if (!is.null(values)) {
    xs <- seq(0, 1, length = length(values))      
    f <- approxfun(values, xs)
    x <- f(x)
  }

  ramp <- colorRamp(colours, space = space)
  function(x) rgb(ramp(x), max = 255)
}

gradient_2_palette <- function(low = "#3B4FB8", mid = "white", high = "#B71B1A", space = "Lab") {
  gradient_n_palette(c(low, mid, high), space = space)
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

gradient_palette <- function(low = "#3B4FB8", high = "#B71B1A", space = "Lab") {
  gradient_n_palette(c(low, high), space = space)
}
