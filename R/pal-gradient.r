gradient_palette <- function(low = "#3B4FB8", high = "#B71B1A", space = "Lab") {
  ramp <- colorRamp(c(.$low, .$high), space = space)

  function(x) rgb(ramp(x), max = 255)
}
