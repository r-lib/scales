gradient_palette <- function(x, low = "#3B4FB8", high = "#B71B1A", space = "Lab") {
  ramp <- colorRamp(c(.$low, .$high), space = space)
  rgb(ramp(x), max = 255)
}
