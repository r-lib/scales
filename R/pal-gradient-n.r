gradientn_palette <- function(colours, values = NULL, space="Lab") {
  if (!is.null(values)) {
    xs <- seq(0, 1, length = length(values))      
    f <- approxfun(values, xs)
    x <- f(x)
  }
  ramp <- colorRamp(colours, space = space)

  function(x) rgb(ramp(x), max = 255)
}
