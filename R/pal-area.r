#' Point area palette (continuous).
#'
#' @param range Numeric vector of length two, giving range of possible sizes.
#'   Should be greater than 0.
#' @export 
area_pal <- function(range = c(1, 6)) {
  function(x) rescale(sqrt(x), range, c(0, 1))
}
