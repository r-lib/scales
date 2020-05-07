#' Equally spaced breaks
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
#' one_month <- as.POSIXct(c("2020-05-01", "2020-06-01"))
#' demo_datetime(one_month)
#' demo_datetime(one_month, breaks = breaks_width("1 week"))
#' demo_datetime(one_month, breaks = breaks_width("5 days"))
#' # This is so useful that scale_x_datetime() has a shorthand:
#' demo_datetime(one_month, date_breaks = "5 days")
#'
#' # hms times also work
#' one_hour <- hms::hms(hours = 0:1)
#' demo_time(one_hour)
#' demo_time(one_hour, breaks = breaks_width("15 min"))
#' demo_time(one_hour, breaks = breaks_width("600 sec"))
breaks_width <- function(width, offset = 0) {
  force_all(width, offset)

  function(x) {
    fullseq(x, width) + offset
  }
}

#' Automatic breaks for numeric axes
#'
#' Uses Wilkinson's extended breaks algorithm as implemented in the
#' \pkg{labeling} package.
#'
#' @param n Desired number of breaks. You may get slightly more or fewer
#'   breaks that requested.
#' @param ... other arguments passed on to [labeling::extended()]
#' @references Talbot, J., Lin, S., Hanrahan, P. (2010) An Extension of
#'  Wilkinson's Algorithm for Positioning Tick Labels on Axes, InfoVis
#'  2010 <http://vis.stanford.edu/files/2010-TickLabels-InfoVis.pdf>.
#' @export
#' @examples
#' demo_continuous(c(0, 10))
#' demo_continuous(c(0, 10), breaks = breaks_extended(3))
#' demo_continuous(c(0, 10), breaks = breaks_extended(10))
breaks_extended <- function(n = 5, ...) {
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

#' @export
#' @usage NULL
#' @rdname breaks_extended
extended_breaks <- breaks_extended

#' Pretty breaks for date/times
#'
#' Uses default R break algorithm as implemented in [pretty()]. This is
#' primarily useful for date/times, as [extended_breaks()] should do a slightly
#' better job for numeric scales.
#'
#' `pretty_breaks()` is retired; use `breaks_pretty()` instead.
#'
#' @inheritParams breaks_extended
#' @param ... other arguments passed on to [pretty()]
#' @export
#' @examples
#' one_month <- as.POSIXct(c("2020-05-01", "2020-06-01"))
#' demo_datetime(one_month)
#' demo_datetime(one_month, breaks = breaks_pretty(2))
#' demo_datetime(one_month, breaks = breaks_pretty(4))
#'
#' # Tightly spaced date breaks often need custom labels too
#' demo_datetime(one_month, breaks = breaks_pretty(12))
#' demo_datetime(one_month,
#'   breaks = breaks_pretty(12),
#'   labels = label_date_short()
#')
breaks_pretty <- function(n = 5, ...) {
  force_all(n, ...)
  n_default <- n
  function(x, n = n_default) {
    breaks <- pretty(x, n, ...)
    names(breaks) <- attr(breaks, "labels")
    breaks
  }
}

#' @export
#' @usage NULL
#' @rdname breaks_pretty
pretty_breaks <- breaks_pretty
