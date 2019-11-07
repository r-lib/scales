#' Hue palette (discrete)
#'
#' @param h range of hues to use, in \[0, 360]
#' @param l luminance (lightness), in \[0, 100]
#' @param c chroma (intensity of colour), maximum value varies depending on
#'   combination of hue and luminance.
#' @param h.start hue to start at
#' @param direction direction to travel around the colour wheel,
#'   1 = clockwise, -1 = counter-clockwise
#' @export
#' @examples
#' show_col(hue_pal()(4))
#' show_col(hue_pal()(9))
#' show_col(hue_pal(l = 90)(9))
#' show_col(hue_pal(l = 30)(9))
#'
#' show_col(hue_pal()(9))
#' show_col(hue_pal(direction = -1)(9))
#'
#' show_col(hue_pal()(9))
#' show_col(hue_pal(h = c(0, 90))(9))
#' show_col(hue_pal(h = c(90, 180))(9))
#' show_col(hue_pal(h = c(180, 270))(9))
#' show_col(hue_pal(h = c(270, 360))(9))
hue_pal <- function(h = c(0, 360) + 15, c = 100, l = 65, h.start = 0, direction = 1) {
  stopifnot(length(h) == 2)
  stopifnot(length(c) == 1)
  stopifnot(length(l) == 1)
  force_all(h, c, l, h.start, direction)
  function(n) {
    if (n == 0) {
      stop("Must request at least one colour from a hue palette.", call. = FALSE)
    }

    if ((diff(h) %% 360) < 1) {
      h[2] <- h[2] - 360 / n
    }

    rotate <- function(x) (x + h.start) %% 360 * direction
    hues <- rotate(seq(h[1], h[2], length.out = n))

    hcl <- cbind(hues, c, l)
    farver::encode_colour(hcl, from = "hcl")
  }
}
