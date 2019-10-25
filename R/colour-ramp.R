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
colour_ramp <- function(colors, na.color = NA, alpha = TRUE) {
  if (length(colors) == 0) {
    stop("Must provide at least one colour to create a colour ramp")
  }

  colorMatrix <- grDevices::col2rgb(colors, alpha = alpha)
  structure(
    function(x) {
      doColorRamp(colorMatrix, x, alpha, ifelse(is.na(na.color), "", na.color))
    },
    safe_palette_func = TRUE
  )
}
