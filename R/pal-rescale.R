#' Rescale palette (continuous)
#'
#' Just rescales the input to the specific output range.  Useful for
#' alpha, size, and continuous position.
#'
#' @param range Numeric vector of length two, giving range of possible
#'   values.  Should be between 0 and 1.
#' @export
pal_rescale <- function(range = c(0.1, 1)) {
  force(range)
  function(x) {
    rescale(x, range, c(0, 1))
  }
}

#' @export
#' @rdname pal_rescale
rescale_pal <- pal_rescale
