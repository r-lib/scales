#' Limits include value
#'
#' @param value A scalar numeric value to include.
#'
#' @returns The `limits_()` functions return a function for setting limits.
#' These functions take as their argument a vector values that represent the
#' natural data limits.
#' @export
#'
#' @examples
#' # Ensure 0 is included in the scale range
#' demo_continuous(c(5, 10), limits = limits_include(0))
limits_include <- function(value = 0) {
  check_number_decimal(value)
  function(x) range(x, value)
}

#' Centered limits
#'
#' @param center A scalar numeric value to serve as midpoint.
#'
#' @returns The `limits_()` functions return a function for setting limits.
#' These functions take as their argument a vector values that represent the
#' natural data limits.
#' @export
#'
#' @examples
#' # Symmetry around 0
#' demo_continuous(c(-5, 10), limits = limits_center(0))
limits_center <- function(center = 0) {
  check_number_decimal(center)
  function(x) c(-1, +1) * max(abs(x - center)) + center
}
