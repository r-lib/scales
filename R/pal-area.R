#' Area palettes (continuous)
#'
#' @param range Numeric vector of length two, giving range of possible sizes.
#'   Should be greater than 0.
#' @export
pal_area <- function(range = c(1, 6)) {
  force(range)
  function(x) rescale(sqrt(x), range, c(0, 1))
}

#' @export
#' @rdname pal_area
area_pal <- pal_area

#' @param max A number representing the maximum size.
#' @export
#' @rdname pal_area
abs_area <- function(max) {
  force(max)
  function(x) rescale(sqrt(abs(x)), c(0, max), c(0, 1))
}
