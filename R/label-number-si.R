#' Label numbers with SI prefixes (2k, 1M, 5m etc)
#'
#' `number_si()` automatically scales and labels with the best
#' [SI prefix](https://en.wikipedia.org/wiki/Metric_prefix),
#' e.g. "k" for values \eqn{\ge} 1e3 and "m" for \eqn{\ge} 1e-3.
#'
#' @inherit number_format return params
#' @param unit Optional units specifier.
#' @param sep Separator between number and SI unit. Defaults to `" "` if
#'   `units` is supplied, and `""` if not.
#' @export
#' @family labels for continuous scales
#' @family labels for log scales
#' @examples
#' demo_continuous(c(1, 1e9), label = label_number_si())
#' demo_continuous(c(1, 5000), label = label_number_si(unit = "g"))
#' demo_continuous(c(1, 1000), label = label_number_si(unit = "m"))
#'
#' demo_log10(c(1, 1e9), breaks = log_breaks(10), labels = label_number_si())
#' demo_log10(c(1e-9, 1), breaks = log_breaks(10), labels = label_number_si(unit = "m"))
label_number_si <- function(accuracy = 1, unit = NULL, sep = NULL, ...) {
  sep <- if (is.null(unit)) "" else " "
  force_all(accuracy, ...)

  function(x) {
    breaks <- 10^c(
      y = -24,
      z = -21,
      a = -18,
      f = -15,
      p = -12,
      n = -9,
      "\u03bc" = -6,
      m = -3,
      0,
      k = 3,
      M = 6,
      G = 9,
      T = 12,
      P = 15,
      E = 18,
      Z = 21,
      Y = 24
    )

    n_suffix <- cut(abs(x),
      breaks = c(unname(breaks), Inf),
      labels = c(names(breaks)),
      right = FALSE
    )
    n_suffix[is.na(n_suffix)] <- names(which.min(breaks))
    suffix <- paste0(sep, n_suffix, unit)

    scale <- 1 / breaks[n_suffix]
    # for handling Inf and 0-1 correctly
    scale[which(scale %in% c(Inf, NA))] <- 1

    number(x,
      accuracy = accuracy,
      scale = unname(scale),
      suffix = suffix,
      ...
    )
  }
}
