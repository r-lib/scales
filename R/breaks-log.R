#' Breaks for log axes
#'
#' This algorithm starts by looking for integer powers of `base`. If that
#' doesn't provide enough breaks, it then looks for additional intermediate
#' breaks which are integer multiples of integer powers of base. If that fails
#' (which it can for very small ranges), we fall back to [extended_breaks()]
#'
#' @details
#' The algorithm starts by looking for a set of integer powers of `base` that
#' cover the range of the data. If that does not generate at least `n - 2`
#' breaks, we look for an integer between 1 and `base` that splits the interval
#' approximately in half. For example, in the case of `base = 10`, this integer
#' is 3 because `log10(3) = 0.477`. This leaves 2 intervals: `c(1, 3)` and
#' `c(3, 10)`. If we still need more breaks, we look for another integer
#' that splits the largest remaining interval (on the log-scale) approximately
#' in half. For `base = 10`, this is 5 because `log10(5) = 0.699`.
#'
#' The generic algorithm starts with a set of integers `steps` containing
#' only 1 and a set of candidate integers containing all integers larger than 1
#' and smaller than `base`. Then for each remaining candidate integer
#' `x`, the smallest interval (on the log-scale) in the vector
#' `sort(c(x, steps, base))` is calculated. The candidate `x` which
#' yields the largest minimal interval is added to `steps` and removed from
#' the candidate set. This is repeated until either a sufficient number of
#' breaks, `>= n-2`, are returned or all candidates have been used.
#' @param n desired number of breaks
#' @param base base of logarithm to use
#'
#' @inherit breaks_width return
#'
#' @export
#' @examples
#' demo_log10(c(1, 1e5))
#' demo_log10(c(1, 1e6))
#'
#' # Request more breaks by setting n
#' demo_log10(c(1, 1e6), breaks = breaks_log(6))
#'
#' # Some tricky ranges
#' demo_log10(c(2000, 9000))
#' demo_log10(c(2000, 14000))
#' demo_log10(c(2000, 85000), expand = c(0, 0))
#'
#' # An even smaller range that requires falling back to linear breaks
#' demo_log10(c(1800, 2000))
breaks_log <- function(n = 5, base = 10) {
  force_all(n, base)
  n_default <- n
  function(x, n = n_default) {
    raw_rng <- suppressWarnings(range(x, na.rm = TRUE))
    if (any(!is.finite(raw_rng))) {
      return(numeric())
    }

    rng <- log(raw_rng, base = base)
    min <- floor(rng[1])
    max <- ceiling(rng[2])

    if (max == min) {
      return(base^min)
    }

    by <- floor((max - min) / n) + 1
    breaks <- base^seq(min, max, by = by)
    relevant_breaks <- base^rng[1] <= breaks & breaks <= base^rng[2]
    if (sum(relevant_breaks) >= (n - 2)) {
      return(breaks)
    }

    # the easy solution to get more breaks is to decrease 'by'
    while (by > 1) {
      by <- by - 1
      breaks <- base^seq(min, max, by = by)
      relevant_breaks <- base^rng[1] <= breaks & breaks <= base^rng[2]
      if (sum(relevant_breaks) >= (n - 2)) {
        return(breaks)
      }
    }
    log_sub_breaks(rng, n = n, base = base)
  }
}

#' @export
#' @usage NULL
#' @rdname breaks_log
log_breaks <- breaks_log

#' Minor breaks for log-10 axes
#'
#' This break function is designed to mark every power, multiples of 5 and/or 1
#' of that power for base 10.
#'
#' @param detail Any of `1`, `5` and `10` to mark multiples of
#'   powers, multiples of 5 of powers or just powers respectively.
#' @param smallest Smallest absolute value to mark when the range includes
#'   negative numbers.
#'
#' @return A function to generate minor ticks.
#'
#' @export
#'
#' @examples
#' # Standard usage with log10 scale
#' demo_log10(c(1, 1e10), minor_breaks = minor_breaks_log())
#' # Increasing detail over many powers
#' demo_log10(c(1, 1e10), minor_breaks = minor_breaks_log(detail = 1))
#' # Adjusting until where to draw minor breaks
#' demo_continuous(
#'   c(-1000, 1000),
#'   transform = asinh_trans(),
#'   minor_breaks = minor_breaks_log(smallest = 1)
#' )
minor_breaks_log <- function(detail = NULL, smallest = NULL) {
  if (!is.null(detail) && (!length(detail) == 1 || !detail %in% c(1, 5, 10))) {
    cli::cli_abort("The {.arg detail} argument must be one of 1, 5 or 10.")
  }
  if (
    !is.null(smallest) &&
      (!length(smallest) == 1 || smallest < 1e-100 || !is.finite(smallest))
  ) {
    cli::cli_abort(
      "The {.arg smallest} argument must be a finite, positive, non-zero number."
    )
  }
  force(smallest)
  function(x, ...) {
    has_negatives <- any(x <= 0)

    if (has_negatives) {
      large <- max(abs(x))
      small <- smallest %||% min(c(1, large) * 0.1)
      x <- sort(c(small * 10, large))
    }

    start <- floor(log10(min(x))) - 1L
    end <- ceiling(log10(max(x))) + 1L

    if (is.null(detail)) {
      i <- findInterval(abs(end - start), c(8, 15), left.open = TRUE) + 1L
      detail <- c(1, 5, 10)[i]
    }

    ladder <- 10^seq(start, end, by = 1L)
    tens <- fives <- ones <- numeric()
    if (detail %in% c(10, 5, 1)) {
      tens <- ladder
    }
    if (detail %in% c(5, 1)) {
      fives <- 5 * ladder
    }
    if (detail == 1) {
      ones <- as.vector(outer(1:9, ladder))
      ones <- setdiff(ones, c(tens, fives))
    }

    if (has_negatives) {
      tens <- tens[tens >= small]
      tens <- c(tens, -tens, 0)
      fives <- fives[fives >= small]
      fives <- c(fives, -fives)
      ones <- ones[ones >= small]
      ones <- c(ones, -ones)
    }

    ticks <- c(tens, fives, ones)
    n <- c(length(tens), length(fives), length(ones))

    attr(ticks, "detail") <- rep(c(10, 5, 1), n)
    ticks
  }
}

#' @author Thierry Onkelinx, \email{thierry.onkelinx@inbo.be}
#' @noRd
log_sub_breaks <- function(rng, n = 5, base = 10) {
  min <- floor(rng[1])
  max <- ceiling(rng[2])
  if (base <= 2) {
    return(base^(min:max))
  }
  steps <- 1
  # 'delta()' calculates the smallest distance in the log scale between the
  # currectly selected breaks and a new candidate 'x'
  delta <- function(x) {
    min(diff(log(sort(c(x, steps, base)), base = base)))
  }
  candidate <- seq_len(base)
  candidate <- candidate[1 < candidate & candidate < base]
  while (length(candidate)) {
    best <- which.max(vapply(candidate, delta, 0))
    steps <- c(steps, candidate[best])
    candidate <- candidate[-best]

    breaks <- as.vector(outer(base^seq(min, max), steps))
    relevant_breaks <- base^rng[1] <= breaks & breaks <= base^rng[2]
    if (sum(relevant_breaks) >= (n - 2)) {
      break
    }
  }
  if (sum(relevant_breaks) >= (n - 2)) {
    breaks <- sort(breaks)
    lower_end <- pmax(min(which(base^rng[1] <= breaks)) - 1, 1)
    upper_end <- pmin(max(which(breaks <= base^rng[2])) + 1, length(breaks))
    breaks[lower_end:upper_end]
  } else {
    extended_breaks(n = n)(base^rng)
  }
}
