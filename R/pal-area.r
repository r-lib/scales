#' Area palettes (continuous)
#'
#' @param range Numeric vector of length two, giving range of possible sizes.
#'   Should be greater than 0.
#' @export
area_pal <- function(range = c(1, 6)) {
  force(range)
  function(x) rescale(sqrt(x), range, c(0, 1))
}

#' @param max A number representing the maximum size.
#' @export
#' @rdname area_pal
abs_area <- function(max) {
  force(max)
  function(x) rescale(sqrt(abs(x)), c(0, max), c(0, 1))
}
