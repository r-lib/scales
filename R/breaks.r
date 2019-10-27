
#' Produce breaks spaced by a fixed distance
#'
#' @param width Distance between each break
#' @param offset Use if you don't want breaks to start at zero
#' @export
#' @examples
#' demo_continuous(c(0, 100))
#' demo_continuous(c(0, 100), breaks = breaks_width(10))
#' demo_continuous(c(0, 100), breaks = breaks_width(20, -4))
#' demo_continuous(c(0, 100), breaks = breaks_width(20, 4))
breaks_width <- function(width, offset = 0) {
  force_all(width, offset)

  function(x) {
    fullseq(x, width) + offset
  }
}

#' Extended breaks
#'
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
  n_default <- n
  function(x, n = n_default) {
    x <- x[is.finite(x)]
    if (length(x) == 0) {
      return(numeric())
    }

    rng <- range(x)
    labeling::extended(rng[1], rng[2], n, ...)
  }
}

