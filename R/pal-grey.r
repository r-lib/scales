#' Grey scale palette (discrete).
#'
#' @export
#' @seealso \code{\link{gradient_palette}} for continuous version
grey_palette <- function(start = 0.2, end = 0.8) {
  function(n) grey.colors(n, start = start, end = end)
}
