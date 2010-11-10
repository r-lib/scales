#' Alpha palette (continuous).
#'
#' @export
alpha_pal <- function(x, to = c(0.1, 1)) {
  rescale(x, to, c(0, 1))
}
