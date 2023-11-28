#' Viridis palette
#'
#' @inheritParams viridisLite::viridis
#' @param begin,end The (corrected) hue in `[0,1]` at which the color map
#'   begins and ends.
#' @param option A character string indicating the color map option to use.
#'   Eight options are available:
#'   * `"magma"` (or `"A"`)
#'   * `"inferno"` (or `"B"`)
#'   * `"plasma"` (or `"C"`)
#'   * `"viridis"` (or `"D"`)
#'   * `"cividis"` (or `"E"`)
#'   * `"rocket"` (or `"F"`)
#'   * `"mako"` (or `"G"`)
#'   * `"turbo"` (or `"H"`)
#' @references <https://bids.github.io/colormap/>
#' @export
#' @examples
#' show_col(pal_viridis()(10))
#' show_col(pal_viridis(direction = -1)(6))
#' show_col(pal_viridis(begin = 0.2, end = 0.8)(4))
#' show_col(pal_viridis(option = "plasma")(6))
pal_viridis <- function(alpha = 1, begin = 0, end = 1, direction = 1, option = "D") {
  force_all(alpha, begin, end, direction, option)
  function(n) {
    viridisLite::viridis(n, alpha, begin, end, direction, option)
  }
}

#' @export
#' @rdname pal_viridis
viridis_pal <- pal_viridis
