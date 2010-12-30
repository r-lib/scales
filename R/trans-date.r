#' Transformation for dates (class Date).
#'
#' @export
#' @examples
#' years <- seq(as.Date("1910/1/1"), as.Date("1999/1/1"), "years")
#' t <- date_trans()
#' t$trans(years)
#' t$inv(t$trans(years))
#' t$format(t$breaks(range(years)))
date_trans <- function() {
  trans_new("date", "from_date", "to_date")
}

to_date <- function(x)   structure(x, class = "Date")
from_date <- function(x) structure(as.numeric(x), names = names(x))

#' Transformation for times (class POSIXt).
#'
#' @export
#' @examples
#' hours <- seq(ISOdate(2000,3,20, tz = ""), by = "hour", length.out = 10)
#' t <- time_trans()
#' t$trans(hours)
#' t$inv(t$trans(hours))
#' t$format(t$breaks(range(hours)))
time_trans <- function() {
  trans_new("time", "from_time", "to_time")
}

to_time <- function(x)   structure(x, class = c("POSIXt", "POSIXct"))
from_time <- function(x) structure(as.numeric(x), names = names(x))

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
#' @export
date_format <- function(format = "%Y-%m-%d") {
  function(x) format(x, format)
}
