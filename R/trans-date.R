#' Transformation for dates (class Date)
#'
#' @export
#' @examples
#' years <- seq(as.Date("1910/1/1"), as.Date("1999/1/1"), "years")
#' t <- date_trans()
#' t$transform(years)
#' t$inverse(t$transform(years))
#' t$format(t$breaks(range(years)))
date_trans <- function() {
  trans_new("date",
    transform = "from_date",
    inverse = "to_date",
    breaks = breaks_pretty(),
    domain = to_date(c(-Inf, Inf))
  )
}

to_date <- function(x) structure(x, class = "Date")
from_date <- function(x) {
  if (!inherits(x, "Date")) {
    cli::cli_abort("{.fun date_trans} works with objects of class {.cls Date} only")
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
#' t <- time_trans()
#' t$transform(hours)
#' t$inverse(t$transform(hours))
#' t$format(t$breaks(range(hours)))
time_trans <- function(tz = NULL) {
  force(tz)
  to_time <- function(x) {
    structure(x, class = c("POSIXt", "POSIXct"), tzone = tz)
  }

  from_time <- function(x) {
    if (!inherits(x, "POSIXct")) {
      cli::cli_abort("{.fun time_trans} works with objects of class {.cls POSIXct} only")
    }
    if (is.null(tz)) {
      tz <<- attr(as.POSIXlt(x), "tzone")[[1]]
    }
    structure(as.numeric(x), names = names(x))
  }

  trans_new("time",
    transform = "from_time",
    inverse = "to_time",
    breaks = breaks_pretty(),
    domain = to_time(c(-Inf, Inf))
  )
}

#' Transformation for times (class hms)
#'
#' `timespan_trans()` provides transformations for data encoding time passed
#' along with breaks and label formatting showing standard unit of time fitting
#' the range of the data. `hms_trans()` provides the same but using standard hms
#' idioms and formatting.
#'
#' @export
#' @examples
#' # timespan_trans allows you to specify the time unit numeric data is
#' # interpreted in
#' min_trans <- timespan_trans("mins")
#' demo_timespan(seq(0, 100), trans = min_trans)
#' # Input already in difftime format is interpreted correctly
#' demo_timespan(as.difftime(seq(0, 100), units = "secs"), trans = min_trans)
#'
#' if (require("hms")) {
#'   # hms_trans always assumes seconds
#'   hms <- round(runif(10) * 86400)
#'   t <- hms_trans()
#'   t$transform(hms)
#'   t$inverse(t$transform(hms))
#'   t$breaks(hms)
#'   # The break labels also follow the hms format
#'   demo_timespan(hms, trans = t)
#' }
#'
timespan_trans <- function(unit = c("secs", "mins", "hours", "days", "weeks")) {
  unit <- arg_match(unit)
  trans_new(
    "timespan",
    transform = function(x) {
      structure(as.numeric(as.difftime(x, units = unit), units = "secs"), names = names(x))
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
#' @rdname timespan_trans
#' @export
hms_trans <- function() {
  trans_new(
    "hms",
    transform = function(x) {
      structure(as.numeric(x), names = names(x))
    },
    inverse = hms::as_hms,
    breaks = breaks_hms()
  )
}

breaks_hms <- function(n = 5) {
  base_breaks <- breaks_timespan("secs", n)
  function(x) {
    hms::as_hms(base_breaks(x))
  }
}
