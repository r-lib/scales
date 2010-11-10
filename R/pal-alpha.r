#' Alpha palette (continuous).
#'
#' @param range Numeric vector of length two, giving range of possible alpha
#'   values.  Should be between 0 and 1.
#' @export
alpha_pal <- function(range = c(0.1, 1)) {
  function(x) {
    rescale(x, range, c(0, 1))
  }
}
