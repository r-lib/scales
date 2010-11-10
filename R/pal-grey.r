#' Grey scale palette (discrete).
#'
#' @param start gray value at low end of palette
#' @param end gray value at high end of palette
#' @seealso \code{\link{seq_gradient_pal}} for continuous version
#' @export
#' @examples
#' show_col(grey_pal()(25))
#' show_col(grey_pal(0, 1)(25))
grey_pal <- function(start = 0.2, end = 0.8) {
  function(n) grey.colors(n, start = start, end = end)
}
