#' Equally spaced breaks
#'
#' Useful for numeric, date, and date-time scales.
#'
#' @param width Distance between each break. Either a number, or for
#'   date/times, a single string of the form `"{n} {unit}"`, e.g. "1 month",
#'   "5 days". Unit can be of one "sec", "min", "hour", "day", "week",
#'   "month", "year".
#' @param offset Use if you don't want breaks to start at zero, or on a
#'   conventional date or time boundary such as the 1st of January or midnight.
#'   Either a number, or for date/times, a single string of the form
#'   `"{n} {unit}"`, as for `width`.
#'
#'   `offset` can be a vector, which will accumulate in the order given. This
#'   is mostly useful for dates, where e.g. `c("3 months", "5 days")` will
#'   offset by three months and five days, which is useful for the UK tax year.
#'   Note that due to way that dates are rounded, there's no guarantee that
#'   `offset = c(x, y)` will give the same result as `offset = c(y, x)`.
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
#'
#' # Offets are useful for years that begin on dates other than the 1st of
#' # January, such as the UK financial year, which begins on the 1st of April.
#' three_years <- as.POSIXct(c("2020-01-01", "2021-01-01", "2022-01-01"))
#' demo_datetime(
#'   three_years,
#'   breaks = breaks_width("1 year", offset = "3 months")
#' )
#'
#' # The offset can be a vector, to create offsets that have compound units,
#' # such as the UK fiscal (tax) year, which begins on the 6th of April.
#' demo_datetime(
#'   three_years,
#'   breaks = breaks_width("1 year", offset = c("3 months", "5 days"))
#' )
breaks_width <- function(width, offset = 0) {
  force_all(width, offset)

  function(x) {
    x <- fullseq(x, width)
    for (i in offset) {
      x <- offset_by(x, i)
    }
    x
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
#' )
breaks_pretty <- function(n = 5, ...) {
  force_all(n, ...)
  n_default <- n
  function(x, n = n_default) {
    breaks <- pretty(x, n, ...)
    names(breaks) <- attr(breaks, "labels")
    breaks
  }
}

#' Superseded interface to `breaks_pretty()`
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' These functions are kept for backward compatibility; you should switch
#' to [breaks_pretty()] for new code.
#'
#' @keywords internal
#' @export
#' @inheritParams breaks_pretty
pretty_breaks <- breaks_pretty
