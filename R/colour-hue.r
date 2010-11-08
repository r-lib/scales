#' @importFrom grDevices hcl
hue_palette <- function(h = c(0, 360) + 15, l = 65, h.start = 0, direction = 1) {
  
  function(n) {
    if ((diff(h) %% 360) < 1) {
      h[2] <- h[2] - 360 / n
    }

    rotate <- function(x) (x + start) %% 360 * direction
    hues <- rotate(seq(h[1], h[2], length = n))

    hcl(hues, c, l)    
  }
}
