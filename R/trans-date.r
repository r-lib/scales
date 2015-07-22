#' Transformation for dates (class Date).
#'
#' @export
#' @examples
#' years <- seq(as.Date("1910/1/1"), as.Date("1999/1/1"), "years")
#' t <- date_trans()
#' t$transform(years)
#' t$inverse(t$transform(years))
#' t$format(t$breaks(range(years)))
date_trans <- function() {
  trans_new("date", "from_date", "to_date", breaks = pretty_breaks())
}

to_date <- function(x)   structure(x, class = "Date")
from_date <- function(x) {
  if (!inherits(x, "Date")) {
    stop("Invalid input: date_trans works with objects of class Date only",
      call. = FALSE)
  }
  structure(as.numeric(x), names = names(x))
}

#' Transformation for times (class POSIXt).
#'
#' @param tz Optionally supply the time zone.  If \code{NULL}, the default,
#'   the time zone will be extracted from first input with a non-null tz.
#' @export
#' @examples
#' hours <- seq(ISOdate(2000,3,20, tz = ""), by = "hour", length.out = 10)
#' t <- time_trans()
#' t$transform(hours)
#' t$inverse(t$transform(hours))
#' t$format(t$breaks(range(hours)))
time_trans <- function(tz = NULL) {

  to_time <- function(x) {
    force(x)
    structure(x, class = c("POSIXt", "POSIXct"), tzone = tz)
  }

  from_time <- function(x) {
    if (!inherits(x, "POSIXct")) {
      stop("Invalid input: time_trans works with objects of class ",
        "POSIXct only", call. = FALSE)
    }
    if (is.null(tz)) {
      tz <<- attr(as.POSIXlt(x), "tzone")[[1]]
    }
    structure(as.numeric(x), names = names(x))
  }

  trans_new("time", "from_time", "to_time", breaks = pretty_breaks())
}


#' Regularly spaced dates.
#'
#' @param width an interval specification, one of "sec", "min", "hour",
#'   "day", "week", "month", "year". Can be by an integer and a space, or
#'   followed by "s".
#' @export
date_breaks <- function(width = "1 month") {
  function(x) fullseq(x, width)
}


#' Formatted dates.
#'
#' @param format Date format using standard POSIX specification.  See
#'  \code{\link{strptime}} for possible formats.
#' @param tz a time zone name, see \code{\link{timezones}}. Defaults
#'  to UTC
#' @export
date_format <- function(format = "%Y-%m-%d", tz = 'UTC') {
  function(x) format(x, format, tz = tz)
}
