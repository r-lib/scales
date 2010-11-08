#' Point size palette (continuous).
#' 
#' @export
size_pal <- function(to = c(1, 6)) {
  function(x) rescale(x, to, c(0, 1))
}

#' Point area palette (continuous).
#'
#' @export 
area_pal <- function(to = c(1, 6)) {
  function(x) rescale(sqrt(x), to, c(0, 1))
}
