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
