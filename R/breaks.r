
#' Pretty breaks.
#' Uses default R break algorithm as implemented in \code{\link{pretty}}
#'
#' @param n desired number of breaks
#' @param ... other arguments passed on to \code{\link{pretty}}
#' @export
pretty_breaks <- function(n = 5, ...) {
  function(x) pretty(x, n, ...)
}

#' Pretty breaks on log scale.
#' Create ticks at evenly spaced powers of ten.
#'
#' @export
log_breaks <- function() {
  function(x) {
    rng <- range(log10(x))
    10 ^ seq(floor(rng[1]), ceiling(rng[2]), by = 1)
  }
}

#' Evenly spaced breaks on transformed scale.
#' These often do not produce very attractive breaks.
#' 
#' @export
#' @examples
#' trans_breaks(log10_trans())(c(1, 1e6))
#' trans_breaks(sqrt_trans())(c(1, 100))
#' trans_breaks(reciprocal_trans())(c(1, 100))
#' trans_breaks(reverse_trans())(c(1, 100))
trans_breaks <- function(trans, n = 5, ...) {
  stopifnot(is.trans(trans))
  
  function(x) {
    trans$inverse(pretty(trans$transform(x), n, ...))
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
#'   called with a vector of breaks
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
cbreaks <- function(range, breaks = pretty_breaks(), labels = scientific_format()) {
  
  if (is.function(breaks)) {
    breaks <- breaks(range)
  }
  
  if (is.function(labels)) {
    labels <- labels(breaks)
  } else {
    if (length(labels) != length(breaks)) {
      stop("Labels and breaks must be same length")
    }
  }
  
  list(breaks = breaks, labels = labels)
}
