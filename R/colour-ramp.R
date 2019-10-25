#' Fast colour interpolation
#'
#' Returns a function that maps the interval \[0,1] to a set of colours.
#' Interpolation is performed in the CIELAB colour space. Similar to
#' \code{\link[grDevices]{colorRamp}(space = 'Lab')}, but hundreds of
#' times faster, and provides results in `"#RRGGBB"` (or
#' `"#RRGGBBAA"`) character form instead of RGB colour matrices.
#'
#' @param colors Colours to interpolate; must be a valid argument to
#'   [grDevices::col2rgb()]. This can be a character vector of
#'   `"#RRGGBB"` or  `"#RRGGBBAA"`, colour names from
#'   [grDevices::colors()], or a positive integer that indexes into
#'   [grDevices::palette()].
#' @param na.color The colour to map to `NA` values (for example,
#'   `"#606060"` for dark grey, or `"#00000000"` for transparent) and
#'   values outside of \[0,1]. Can itself by `NA`, which will simply cause
#'   an `NA` to be inserted into the output.
#' @param alpha Whether to include alpha transparency channels in interpolation.
#'   If `TRUE` then the alpha information is included in the interpolation.
#'   The returned colours will be provided in `"#RRGGBBAA"` format when needed,
#'   i.e., in cases where the colour is not fully opaque, so that the `"AA"`
#'   part is not equal to `"FF"`. Fully opaque colours will be returned in
#'   `"#RRGGBB"` format. If `FALSE`, the alpha information is discarded
#'   before interpolation and colours are always returned as `"#RRGGBB"`.
#'
#' @return A function that takes a numeric vector and returns a character vector
#'   of the same length with RGB or RGBA hex colours.
#'
#' @seealso \code{\link[grDevices]{colorRamp}}
#'
#' @export
#' @examples
#' ramp <- colour_ramp(c("red", "green", "blue"))
#' show_col(ramp(seq(0, 1, length = 12)))
colour_ramp <- function(colors, na.color = NA, alpha = TRUE) {
  if (testthat::is_testing())
    testthat::skip("Skipping colour ramp tests")

  if (length(colors) == 0) {
    stop("Must provide at least one colour to create a colour ramp")
  }

  rgb_in <- t(grDevices::col2rgb(colors, alpha = TRUE))
  lab_in <- farver::convert_colour(rgb_in[, 1:3], "rgb", "lab")

  x_in <- seq(0, 1, length = length(colors))
  l_interp <- stats::approxfun(x_in, lab_in[, 1])
  u_interp <- stats::approxfun(x_in, lab_in[, 2])
  v_interp <- stats::approxfun(x_in, lab_in[, 3])

  if (alpha) {
    alpha_interp <- function(x) NULL
  } else {
    alpha_interp <- stats::approxfun(x_in, rgb_in[, 4])
  }

  structure(
    function(x) {
      lab_out <- cbind(l_interp(x), u_interp(x), v_interp(x))
      rgb_out <- farver::convert_colour(lab_out, "lab", "rgb")

      rgb_out[] <- pmax(0, rgb_out)
      out <- rep(NA_character_, length(x))
      na <- !stats::complete.cases(rgb_out)
      out[!na] <- grDevices::rgb(
        rgb_out[!na, , drop = FALSE],
        alpha = alpha_interp(rgb_in[!na, 4]),
        maxColorValue = 255
      )
      out[na] <- na.color
      out
    },
    safe_palette_func = TRUE
  )
}
