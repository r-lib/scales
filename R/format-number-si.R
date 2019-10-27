#' Rescale numbers with SI prefixes
#'
#' `number_si()` automatically scales and labels with the best SI prefix,
#' "K" for values \eqn{\ge} 10e3, "M" for \eqn{\ge} 10e6,
#' "B" for \eqn{\ge} 10e9, and "T" for \eqn{\ge} 10e12.
#'
#' @inheritParams number_format
#' @param suffix Suffix to add after SI label
#' @export
#' @examples
#' demo_continuous(c(1, 1e9), label = number_si)
#' demo_log10(c(1, 1e9), breaks = log_breaks(10), labels = number_si)
number_si <- function(x, accuracy = 1, prefix = "", suffix = "", ...) {
  breaks <- c(" " = 0, 10^c(K = 3, M = 6, B = 9, "T" = 12))

  n_suffix <- cut(abs(x),
    breaks = c(unname(breaks), Inf),
    labels = c(names(breaks)),
    right = FALSE
  )
  n_suffix[is.na(n_suffix)] <- " "
  suffix <- paste0(n_suffix, suffix)

  scale <- 1 / breaks[n_suffix]
  # for handling Inf and 0-1 correctly
  scale[which(scale %in% c(Inf, NA))] <- 1

  number(x,
    accuracy = accuracy,
    scale = unname(scale),
    prefix = prefix,
    suffix = suffix,
    ...
  )
}
