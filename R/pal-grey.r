#' Grey scale palette (discrete).
#'
#' @param start grey value at low end of palette
#' @param end grey value at high end of palette
#' @seealso [seq_gradient_pal()] for continuous version
#' @export
#' @examples
#' show_col(grey_pal()(25))
#' show_col(grey_pal(0, 1)(25))
grey_pal <- function(start = 0.2, end = 0.8) {
  force_all(start, end)
  function(n) grDevices::grey.colors(n, start = start, end = end)
}
