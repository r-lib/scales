#' Unit and degree labels
#'
#' These are thin wrappers around [number_format()]
#'
#' @inheritParams number_format
#' @param unit The units to append.
#' @param sep The separator between the number and the unit label.
#' @export
#' @examples
#' # Label with units
#' demo_continuous(c(0, 1), labels = unit_format(unit = "m"))
#' # Labels in kg, but original data in g
#' km <- unit_format(unit = "km", scale = 1e-3, digits = 2)
#' demo_continuous(c(0, 2500), labels = km)
#' # Or with degrees
#' demo_continuous(c(32, 212), label = degree_format(unit = "F"))
#' demo_continuous(c(0, 100), label = degree_format(unit = "C"))
unit_format <- function(accuracy = NULL, scale = 1, prefix = "",
                        unit = "m", sep = " ", suffix = paste0(sep, unit),
                        big.mark = " ", decimal.mark = ".",
                        trim = TRUE, ...) {
  number_format(
    accuracy = accuracy,
    scale = scale,
    prefix = prefix,
    suffix = suffix,
    big.mark = big.mark,
    decimal.mark = decimal.mark,
    trim = trim,
    ...
  )
}

#' @rdname unit_format
#' @export
degree_format <- function(accuracy = NULL, scale = 1, prefix = "",
                          unit = "", sep = "",
                          suffix = paste0(sep, "\u00b0", unit),
                          big.mark = " ", decimal.mark = ".",
                          trim = TRUE, ...) {
  number_format(
    accuracy = accuracy,
    scale = scale,
    prefix = prefix,
    suffix = suffix,
    big.mark = big.mark,
    decimal.mark = decimal.mark,
    trim = trim,
    ...
  )
}
