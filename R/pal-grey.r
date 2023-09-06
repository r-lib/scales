#' Grey scale palette (discrete)
#'
#' @param start grey value at low end of palette
#' @param end grey value at high end of palette
#' @seealso [pal_seq_gradient()] for continuous version
#' @export
#' @examples
#' show_col(pal_grey()(25))
#' show_col(pal_grey(0, 1)(25))
pal_grey <- function(start = 0.2, end = 0.8) {
  force_all(start, end)
  function(n) grDevices::grey.colors(n, start = start, end = end)
}

#' @export
#' @rdname pal_grey
grey_pal <- pal_grey
