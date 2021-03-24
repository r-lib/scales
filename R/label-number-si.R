#' Label numbers with SI prefixes (2 kg, 5 mm etc)
#'
#' `number_si()` automatically scales and labels with the best SI prefix,
#' e.g. "k" for values \eqn{\ge} 1e3 and "m" for \eqn{\ge} 1e-3.
#'
#' @inherit number_format return params
#' @param unit Optional units specifier.
#' @export
#' @family labels for continuous scales
#' @family labels for log scales
#' @examples
#' demo_continuous(c(1, 1e9), labels = label_number_si())
#' demo_continuous(c(1, 5000), labels = label_number_si(unit = "g"))
#' demo_continuous(c(1, 1000), labels = label_number_si(unit = "m"))
#'
#' demo_log10(c(1, 1e9), breaks = log_breaks(10), labels = label_number_si())
#' demo_log10(c(1e-9, 1), breaks = log_breaks(10), labels = label_number_si(unit = "m"))
label_number_si <- function(unit = NULL, accuracy = NULL, scale = 1, ...) {
  sep <- if (is.null(unit)) "" else " "
  force_all(accuracy, ...)

  function(x) {
    rescale <- rescale_by_suffix(x * scale, breaks = 10^si_powers)

    suffix <- paste0(sep, rescale$suffix, unit)
    scale <- scale * rescale$scale

    number(x,
      accuracy = accuracy,
      scale = scale,
      suffix = suffix,
      ...
    )
  }
}

# power-of-ten prefixes used by the International System of Units (SI)
# https://www.bipm.org/en/measurement-units/prefixes.html
#
# note: irregular prefixes (hecto, deca, deci, centi) are not stored
# because they don't commonly appear in scientific usage anymore
si_powers <- (-8:8) * 3
names(si_powers) <- c(
  rev(c("m", "\u00b5", "n", "p", "f", "a", "z", "y")), "",
  "k", "M",      "G", "T", "P", "E", "Z", "Y"
)
si_powers
