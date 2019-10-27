
#' Produce breaks spaced by a fixed distance
#'
#' Useful for numeric, date, and date-time scales.
#'
#' @param width Distance between each break. Either a number, or for
#'   date/times, a single string of the form "{n} {unit}", e.g. "1 month",
#'   "5 days". Unit can be of one "sec", "min", "hour", "day", "week",
#'   "month", "year".
#' @param offset Use if you don't want breaks to start at zero
#' @export
#' @examples
#' demo_continuous(c(0, 100))
#' demo_continuous(c(0, 100), breaks = breaks_width(10))
#' demo_continuous(c(0, 100), breaks = breaks_width(20, -4))
#' demo_continuous(c(0, 100), breaks = breaks_width(20, 4))
#'
#' # This is also useful for dates
#' one_months <- as.POSIXct(c("2020-05-01", "2020-06-01"))
#' demo_datetime(two_months)
#' demo_datetime(two_months, breaks = breaks_width("1 week"))
#' demo_datetime(two_months, breaks = breaks_width("5 days"))
#' # This is so useful that scale_x_datetime() has a shorthand:
#' demo_datetime(two_months, date_breaks = "5 days")
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

#' Pretty breaks
#'
#' Uses default R break algorithm as implemented in [pretty()]. This is
#' primarily useful for date/times, as [extended_breaks()] should do a slightly
#' better job for numeric scales.
#'
#' @param n desired number of breaks
#' @param ... other arguments passed on to [pretty()]
#' @keywords internal
#' @export
#' @examples
#' one_months <- as.POSIXct(c("2020-05-01", "2020-06-01"))
#' demo_datetime(two_months)
#' demo_datetime(two_months, breaks = pretty_breaks(10))
pretty_breaks <- function(n = 5, ...) {
  force_all(n, ...)
  n_default <- n
  function(x, n = n_default) {
    breaks <- pretty(x, n, ...)
    names(breaks) <- attr(breaks, "labels")
    breaks
  }
}

