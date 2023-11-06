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
#' show_col(pal_hue()(4))
#' show_col(pal_hue()(9))
#' show_col(pal_hue(l = 90)(9))
#' show_col(pal_hue(l = 30)(9))
#'
#' show_col(pal_hue()(9))
#' show_col(pal_hue(direction = -1)(9))
#' show_col(pal_hue(h.start = 30)(9))
#' show_col(pal_hue(h.start = 90)(9))
#'
#' show_col(pal_hue()(9))
#' show_col(pal_hue(h = c(0, 90))(9))
#' show_col(pal_hue(h = c(90, 180))(9))
#' show_col(pal_hue(h = c(180, 270))(9))
#' show_col(pal_hue(h = c(270, 360))(9))
pal_hue <- function(h = c(0, 360) + 15, c = 100, l = 65, h.start = 0, direction = 1) {
  if (length(h) != 2) cli::cli_abort("{.arg h} must have length 2.")
  if (length(l) != 1) cli::cli_abort("{.arg l} must have length 1.")
  if (length(c) != 1) cli::cli_abort("{.arg c} must have length 1.")
  force_all(h, c, l, h.start, direction)
  function(n) {
    if (n == 0) {
      cli::cli_abort("Must request at least one colour from a hue palette.")
    }

    if ((diff(h) %% 360) < 1) {
      h[2] <- h[2] - 360 / n
    }

    hues <- seq(h[1], h[2], length.out = n)
    hues <- (hues + h.start) %% 360

    hcl <- cbind(hues, c, l)

    pal <- farver::encode_colour(hcl, from = "hcl")

    if (direction == -1) {
      rev(pal)
    } else {
      pal
    }
  }
}

#' @export
#' @rdname pal_hue
hue_pal <- pal_hue

