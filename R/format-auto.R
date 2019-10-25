#' Automatic number formatter
#'
#' Switches between [comma()] and [scientific()] format based on a set of
#' heuristics designed to automatically generate useful labels across a wide
#' range of inputs
#'
#' @inheritParams number_format
#' @export
#' @examples
#' b <- function(a, b) extended_breaks(5)(c(a, b))
#'
#' number_auto(b(0, 1e-6))
#' number_auto(b(0, 1e-3))
#' number_auto(b(0, 1))
#' number_auto(b(0, 1e3))
#' number_auto(b(0, 1e6))
#' number_auto(b(0, 1e9))
number_auto <- function(x) {
  if (length(x) == 0) return(character(0))
  if (sum(is.finite(x)) == 0) return(format(x, trim = TRUE))

  max_magnitude <- max(abs(x[x != 0 & is.finite(x)]))
  min_magnitude <- min(abs(x[x != 0 & is.finite(x)]))

  if (max_magnitude > 1e6) {
    format_shortest(
      x,
      comma,
      function(breaks) format(breaks, scientific = TRUE, trim = TRUE)
    )
  } else if (min_magnitude < 1e-3) {
    format_shortest(
      x,
      function(breaks) format(breaks, scientific = FALSE, trim = TRUE),
      function(breaks) format(breaks, scientific = TRUE, trim = TRUE)
    )
  } else if (all(x > 0) && min_magnitude >= 1000 && max_magnitude <= 2200) {
    # Probably a year so don't use commas
    format(x, trim = TRUE)
  } else if (max_magnitude > 1e3) {
    comma(x)
  } else {
    format(x, trim = TRUE)
  }
}

format_shortest <- function(breaks, ...) {
  options <- list(...)
  labels <- lapply(options, function(labeller) labeller(breaks))
  lengths <- vapply(labels, function(label) max(nchar(label)), integer(1))
  labels[[which.min(lengths)]]
}
