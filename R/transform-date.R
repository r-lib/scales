#' Transformation for dates (class Date)
#'
#' @export
#' @examples
#' years <- seq(as.Date("1910/1/1"), as.Date("1999/1/1"), "years")
#' t <- transform_date()
#' t$transform(years)
#' t$inverse(t$transform(years))
#' t$format(t$breaks(range(years)))
transform_date <- function() {
  new_transform(
    "date",
    transform = "from_date",
    inverse = "to_date",
    breaks = breaks_pretty(),
    domain = to_date(c(-Inf, Inf))
  )
}

#' @export
#' @rdname transform_date
date_trans <- transform_date

to_date <- function(x) structure(x, class = "Date")
from_date <- function(x) {
  if (!inherits(x, "Date")) {
    cli::cli_abort(
      "{.fun transform_date} works with objects of class {.cls Date} only"
    )
  }
  structure(as.numeric(x), names = names(x))
}

#' Transformation for date-times (class POSIXt)
#'
#' @param tz Optionally supply the time zone.  If `NULL`, the default,
#'   the time zone will be extracted from first input with a non-null tz.
#' @export
#' @examples
#' hours <- seq(ISOdate(2000, 3, 20, tz = ""), by = "hour", length.out = 10)
#' t <- transform_time()
#' t$transform(hours)
#' t$inverse(t$transform(hours))
#' t$format(t$breaks(range(hours)))
transform_time <- function(tz = NULL) {
  force(tz)
  to_time <- function(x) {
    structure(x, class = c("POSIXct", "POSIXt"), tzone = tz)
  }

  from_time <- function(x) {
    if (!inherits(x, "POSIXct")) {
      cli::cli_abort(
        "{.fun transform_time} works with objects of class {.cls POSIXct} only"
      )
    }
    if (is.null(tz)) {
      tz <<- attr(as.POSIXlt(x), "tzone")[[1]]
    }
    structure(as.numeric(x), names = names(x))
  }

  new_transform(
    "time",
    transform = "from_time",
    inverse = "to_time",
    breaks = breaks_pretty(),
    domain = to_time(c(-Inf, Inf))
  )
}

#' @export
#' @rdname transform_time
time_trans <- transform_time

#' Transformation for times (class hms)
#'
#' `transform_timespan()` provides transformations for data encoding time passed
#' along with breaks and label formatting showing standard unit of time fitting
#' the range of the data. `transform_hms()` provides the same but using standard
#' hms idioms and formatting.
#'
#' @inheritParams label_timespan
#' @export
#' @examples
#' # transform_timespan allows you to specify the time unit numeric data is
#' # interpreted in
#' trans_min <- transform_timespan("mins")
#' demo_timespan(seq(0, 100), trans = trans_min)
#' # Input already in difftime format is interpreted correctly
#' demo_timespan(as.difftime(seq(0, 100), units = "secs"), trans = trans_min)
#'
#' if (require("hms")) {
#'   # transform_hms always assumes seconds
#'   hms <- round(runif(10) * 86400)
#'   t <- transform_hms()
#'   t$transform(hms)
#'   t$inverse(t$transform(hms))
#'   t$breaks(hms)
#'   # The break labels also follow the hms format
#'   demo_timespan(hms, trans = t)
#' }
#'
transform_timespan <- function(
  unit = c("secs", "mins", "hours", "days", "weeks")
) {
  unit <- arg_match(unit)
  new_transform(
    "timespan",
    transform = function(x) {
      structure(
        as.numeric(as.difftime(x, units = unit), units = "secs"),
        names = names(x)
      )
    },
    inverse = function(x) {
      x <- as.difftime(x, units = "secs")
      units(x) <- unit
      x
    },
    breaks = breaks_timespan(unit),
    format = label_timespan(unit)
  )
}

#' @export
#' @rdname transform_timespan
timespan_trans <- transform_timespan

#' @rdname transform_timespan
#' @export
transform_hms <- function() {
  check_installed("hms", "for the 'hms' transformation.")
  new_transform(
    "hms",
    transform = function(x) {
      structure(as.numeric(x), names = names(x))
    },
    inverse = hms::as_hms,
    breaks = breaks_hms()
  )
}

#' @rdname transform_timespan
#' @export
hms_trans <- transform_hms

breaks_hms <- function(n = 5) {
  base_breaks <- breaks_timespan("secs", n)
  function(x) {
    hms::as_hms(base_breaks(x))
  }
}
