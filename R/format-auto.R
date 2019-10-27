#' Label numbers, avoiding scientific notation where possible
#'
#' Switches between [number_format()] and [scientific_format()] based on a set of
#' heuristics designed to automatically generate useful labels across a wide
#' range of inputs
#'
#' @inheritParams number_format
#' @export
#' @examples
#' # Very small and very large numbers get scientific notation
#' demo_continuous(c(0, 1e-6), labels = label_number_auto())
#' demo_continuous(c(0, 1e9), labels = label_number_auto())
#'
#' # Other ranges get the numbers printed in full
#' demo_continuous(c(0, 1e-3), labels = label_number_auto())
#' demo_continuous(c(0, 1), labels = label_number_auto())
#' demo_continuous(c(0, 1e3), labels = label_number_auto())
#' demo_continuous(c(0, 1e6), labels = label_number_auto())
label_number_auto <- function() {

  function(x) {
    if (length(x) == 0) return(character(0))
    if (sum(is.finite(x)) == 0) return(format(x, trim = TRUE))

    max_magnitude <- max(abs(x[x != 0 & is.finite(x)]))
    min_magnitude <- min(abs(x[x != 0 & is.finite(x)]))

    if (max_magnitude > 1e6) {
      format_shortest(x,
        number_format(1),
        format_format(scientific = TRUE)
      )
    } else if (min_magnitude < 1e-3) {
      format_shortest(x,
        format_format(scientific = FALSE),
        format_format(scientific = TRUE)
      )
    } else if (all(x > 0) && min_magnitude >= 1000 && max_magnitude <= 2200) {
      # Probably a year so don't use commas
      format(x, trim = TRUE)
    } else if (max_magnitude > 1e3) {
      number(x, 1)
    } else {
      format(x, trim = TRUE)
    }
  }
}

format_shortest <- function(breaks, ...) {
  options <- list(...)
  labels <- lapply(options, function(labeller) labeller(breaks))
  lengths <- vapply(labels, function(label) max(nchar(label)), integer(1))
  labels[[which.min(lengths)]]
}
