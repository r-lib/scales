#' Hue palette (discrete).
#'
#' @param h range of hues to use, in [0, 360]
#' @param l luminance (lightness), in [0, 100]
#' @param c chroma (intensity of colour), maximum value varies depending on
#    combination of hue and luminance.
#' @param h.start hue to start at
#' @param direction direction to travel around the colour wheel, 
#'   1 = clockwise, -1 = counter-clockwise
#' @importFrom grDevices hcl
#' @export
hue_pal <- function(h = c(0, 360) + 15, l = 65, h.start = 0, direction = 1) {
  
  function(n) {
    if ((diff(h) %% 360) < 1) {
      h[2] <- h[2] - 360 / n
    }

    rotate <- function(x) (x + start) %% 360 * direction
    hues <- rotate(seq(h[1], h[2], length = n))

    hcl(hues, c, l)    
  }
}
