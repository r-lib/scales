#' Pretty breaks.
#' Uses default R break algorithm as implemented in [pretty()].
#'
#' @param n desired number of breaks
#' @param ... other arguments passed on to [pretty()]
#' @export
#' @examples
#' pretty_breaks()(1:10)
#' pretty_breaks()(1:100)
#' pretty_breaks()(as.Date(c("2008-01-01", "2009-01-01")))
#' pretty_breaks()(as.Date(c("2008-01-01", "2090-01-01")))
pretty_breaks <- function(n = 5, ...) {
  force_all(n, ...)
  function(x) {
    breaks <- pretty(x, n, ...)
    names(breaks) <- attr(breaks, "labels")
    breaks
  }
}

#' Extended breaks.
#' Uses Wilkinson's extended breaks algorithm as implemented in the
#' \pkg{labeling} package.
#'
#' @param n desired number of breaks
#' @param ... other arguments passed on to [labeling::extended()]
#' @references Talbot, J., Lin, S., Hanrahan, P. (2010) An Extension of
#'  Wilkinson's Algorithm for Positioning Tick Labels on Axes, InfoVis
#'  2010.
#' @export
#' @examples
#' extended_breaks()(1:10)
#' extended_breaks()(1:100)
extended_breaks <- function(n = 5, ...) {
  function(x) {
    x <- x[is.finite(x)]
    if (length(x) == 0) {
      return(numeric())
    }

    rng <- range(x)
    labeling::extended(rng[1], rng[2], n, ...)
  }
}

#' Log breaks (integer breaks on log-transformed scales).
#'
#' @param n desired number of breaks
#' @param base base of logarithm to use
#' @export
#' @examples
#' log_breaks()(c(1, 1e6))
#' log_breaks()(c(1, 1e5))
#' log_breaks()(c(1664, 14008))
#' log_breaks()(c(407, 3430))
#' log_breaks()(c(1761, 8557))
log_breaks <- function(n = 5, base = 10) {
  force_all(n, base)
  function(x) {
    rng <- log(range(x, na.rm = TRUE), base = base)
    min <- floor(rng[1])
    max <- ceiling(rng[2])

    if (max == min) return(base^min)

    by <- floor((max - min) / n) + 1
    breaks <- base^seq(min, max, by = by)
    relevant_breaks <- base^rng[1] <= breaks & breaks <= base^rng[2]
    if (sum(relevant_breaks) >= (n - 2)) return(breaks)

    # the easy solution to get more breaks is to decrease 'by'
    while (by > 1) {
      by <- by - 1
      breaks <- base^seq(min, max, by = by)
      relevant_breaks <- base^rng[1] <= breaks & breaks <= base^rng[2]
      if (sum(relevant_breaks) >= (n - 2)) return(breaks)
    }
    log_sub_breaks(rng, n = n, base = base)
  }
}

#' Intermediate log-scale breaks
#'
#' Integer powers of base do not always return sufficient breaks.
#' \code{log_sub_breaks} adds intermediate breaks which are integer multiples of
#' integer powers of base. See Details for the implementation.
#' @param rng log-range of the values
#' @inheritParams log_breaks
#' @author Thierry Onkelinx, \email{thierry.onkelinx@inbo.be}
#' @details The \code{log_breaks} algorithm will always use the integer power
#' of \code{base} so the set of integers to multiply with will always
#' contain 1. \code{log_sub_breaks} searches for the integer between 1 and
#' \code{base} which splits the interval approximately in half; e.g., in the
#' case of \code{base = 10}, this integer is 3 because \code{log10(3) = 0.477}.
#' This leaves 2 intervals: \code{c(1, 3)} and \code{c(3, 10)}. The
#' algorithm then looks for another integer which splits the largest remaining
#' interval (in the log-scale) approximately in half, in this case 5
#' (\code{log10(5) = 0.699}).
#'
#' The generic algorithm starts with a set of integers \code{steps} containing
#' only 1 and a set of candidate integers containing all integers larger than 1
#' and smaller than \code{base}. Then for each remaining candidate integer
#' \code{x}, the smallest interval (on the log-scale) in the vector
#' \code{sort(c(x, steps, base))} is calculated. The candidate \code{x} which
#' yields the largest minimal interval is added to \code{steps} and removed from
#' the candidate set. This is repeated until either a sufficient number of
#' breaks, \code{>= n-2}, are returned or all candidates have been used.
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
  breaks <- sort(breaks)
  lower_end <- pmax(min(which(base^rng[1] <= breaks)) - 1, 1)
  upper_end <- pmin(max(which(breaks <= base^rng[2])) + 1, length(breaks))
  breaks[lower_end:upper_end]
}

#' Pretty breaks on transformed scale.
#'
#' These often do not produce very attractive breaks.
#'
#' @param trans function of single variable, `x`, that given a numeric
#'   vector returns the transformed values
#' @param inv inverse of the transformation function
#' @param n desired number of ticks
#' @param ... other arguments passed on to pretty
#' @export
#' @examples
#' trans_breaks("log10", function(x) 10 ^ x)(c(1, 1e6))
#' trans_breaks("sqrt", function(x) x ^ 2)(c(1, 100))
#' trans_breaks(function(x) 1 / x, function(x) 1 / x)(c(1, 100))
#' trans_breaks(function(x) -x, function(x) -x)(c(1, 100))
trans_breaks <- function(trans, inv, n = 5, ...) {
  trans <- match.fun(trans)
  inv <- match.fun(inv)
  force_all(n, ...)
  function(x) {
    inv(pretty(trans(x), n, ...))
  }
}

#' Compute breaks for continuous scale.
#'
#' This function wraps up the components needed to go from a continuous range
#' to a set of breaks and labels suitable for display on axes or legends.
#'
#' @param range numeric vector of length 2 giving the range of the underlying
#'   data
#' @param breaks either a vector of break values, or a break function that
#'   will make a vector of breaks when given the range of the data
#' @param labels either a vector of labels (character vector or list of
#'   expression) or a format function that will make a vector of labels when
#'   called with a vector of breaks. Labels can only be specified manually if
#'   breaks are - it is extremely dangerous to supply labels if you don't know
#'   what the breaks will be.
#' @export
#' @examples
#' cbreaks(c(0, 100))
#' cbreaks(c(0, 100), pretty_breaks(3))
#' cbreaks(c(0, 100), pretty_breaks(10))
#' cbreaks(c(1, 100), log_breaks())
#' cbreaks(c(1, 1e4), log_breaks())
#'
#' cbreaks(c(0, 100), labels = math_format())
#' cbreaks(c(0, 1), labels = percent_format())
#' cbreaks(c(0, 1e6), labels = comma_format())
#' cbreaks(c(0, 1e6), labels = dollar_format())
#' cbreaks(c(0, 30), labels = dollar_format())
#'
#' # You can also specify them manually:
#' cbreaks(c(0, 100), breaks = c(15, 20, 80))
#' cbreaks(c(0, 100), breaks = c(15, 20, 80), labels = c(1.5, 2.0, 8.0))
#' cbreaks(c(0, 100), breaks = c(15, 20, 80),
#'   labels = expression(alpha, beta, gamma))
cbreaks <- function(range, breaks = extended_breaks(), labels = scientific_format()) {
  if (zero_range(range)) {
    return(list(breaks = range[1], labels = format(range[1])))
  }

  if (is.function(breaks)) {
    breaks <- breaks(range)

    if (!is.function(labels)) {
      stop("Labels can only be manually specified in conjunction with breaks",
        call. = FALSE
      )
    }
  }

  if (is.function(labels)) {
    labels <- labels(breaks)
  } else {
    if (length(labels) != length(breaks)) {
      stop("Labels and breaks must be same length")
    }
    if (is.expression(labels)) {
      labels <- as.list(labels)
    } else {
      labels <- as.character(labels)
    }
  }

  list(breaks = breaks, labels = labels)
}

#' Minor breaks.
#' Places minor breaks between major breaks.
#'
#' @param reverse if TRUE, calculates the minor breaks for a reversed scale
#' @export
#' @examples
#' m <- extended_breaks()(c(1, 10))
#' regular_minor_breaks()(m, c(1, 10), n = 2)
#'
#' n <- extended_breaks()(c(0, -9))
#' regular_minor_breaks(reverse = TRUE)(n, c(0, -9), n = 2)
regular_minor_breaks <- function(reverse = FALSE) {
  function(b, limits, n) {
    b <- b[!is.na(b)]
    if (length(b) < 2) return()

    bd <- diff(b)[1]

    # Allow minor breaks to extend outside major breaks towards limits
    if (!reverse) {
      if (min(limits) < min(b)) b <- c(b[1] - bd, b)
      if (max(limits) > max(b)) b <- c(b, b[length(b)] + bd)
    } else {
      if (max(limits) > max(b)) b <- c(b[1] - bd, b)
      if (min(limits) < min(b)) b <- c(b, b[length(b)] + bd)
    }

    # Find minor breaks between major breaks
    seq_between <- function(a, b) {
      seq(a, b, length.out = n + 1)[-(n + 1)]
    }
    breaks <- unlist(Map(seq_between, b[-length(b)], b[-1]))

    # Add the final break back
    breaks <- c(breaks, b[length(b)])
    breaks
  }
}
