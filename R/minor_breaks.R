#' Minor breaks
#'
#' Generate minor breaks between major breaks either spaced with a fixed width,
#' or having a fixed number.
#'
#' @inheritParams breaks_width
#' @export
#' @examples
#' demo_log10(c(1, 1e6))
#' if (FALSE) {
#'   # Requires https://github.com/tidyverse/ggplot2/pull/3591
#'   demo_log10(c(1, 1e6), minor_breaks = minor_breaks_n(10))
#' }
minor_breaks_width <- function(width, offset) {
  # Check that has needed version of ggplot2
  f <- breaks_width(width, offset)

  function(range, breaks) {
    loop_breaks(range, breaks, f)
  }
}

#' @export
#' @param n number of breaks
#' @rdname minor_breaks_width
minor_breaks_n <- function(n) {
  # Check that has needed version of ggplot2
  force(n)
  f <- function(rng) seq(rng[1], rng[2], length = n)

  function(range, breaks) {
    loop_breaks(range, breaks, f)
  }
}

loop_breaks <- function(range, breaks, f) {
  n <- length(breaks)
  out <- vector("list", n + 1)

  out[[1]] <- f(c(range[[1]], breaks[[1]]))
  for (i in seq2(2, n)) {
    out[[i]] <- f(breaks[c(i - 1L, i)])
  }
  out[[n + 1]] <- f(c(breaks[[n]], range[[2]]))

  unique(unlist(out))
}


# old interface -----------------------------------------------------------

#' Minor breaks
#'
#' Places minor breaks between major breaks.
#'
#' @param reverse if TRUE, calculates the minor breaks for a reversed scale
#' @keywords internal
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
    if (length(b) < 2) {
      return()
    }

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
