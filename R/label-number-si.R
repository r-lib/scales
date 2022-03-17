#' Label numbers with SI prefixes (2 kg, 5 mm, etc)
#'
#' `label_number_si()` automatically adds the most suitable SI prefix and scales
#' the values appropriately. For example, values greater than 1000 gain a "k"
#' prefix (abbreviated from "kilo-") and are scaled by 1/1000.
#' See [Metric Prefix](https://en.wikipedia.org/wiki/Metric_prefix) on Wikipedia
#' for more details.
#'
#' @inherit number_format return params
#' @param unit Unit of measurement (e.g. `"m"` for meter, the SI unit of length).
#' @param scale A scaling factor: `x` will be multiplied by `scale` before
#'   formatting. This is useful if the underlying data is already using an SI
#'   prefix.
#' @export
#' @family labels for continuous scales
#' @family labels for log scales
#' @examples
#' demo_continuous(c(1, 1000), labels = label_number_si("m"))
#'
#' demo_log10(c(1, 1e9), breaks = log_breaks(10), labels = label_number_si("m"))
#' demo_log10(c(1e-9, 1), breaks = log_breaks(10), labels = label_number_si("g"))
#'
#' # use scale when data already uses SI prefix (e.g. stored in kg)
#' kg <- label_number_si("g", scale = 1e3)
#' demo_log10(c(1e-9, 1), breaks = log_breaks(10), labels = kg)
label_number_si <- function(unit, accuracy = NULL, scale = 1, ...) {
  sep <- if (is.null(unit) || !nzchar(unit)) "" else " "
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
