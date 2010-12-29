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
  trans_new("date", "from_date", "to_date", pretty_breaks(), attr_format())
}

to_date <- function(x) {
  structure(x, class = c("Date"), labels = attr(x, "labels"))
}
from_date <- function(x) {
  structure(as.numeric(x), labels = attr(x, "labels"))
}

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
  trans_new("time", "from_time", "to_time", pretty_breaks(), attr_format())
}

to_time <- function(x) {
  structure(x, class = c("POSIXt", "POSIXct"), labels = attr(x, "labels"))
}
from_time <- function(x) {
  structure(as.numeric(x), labels = attr(x, "labels"))
}

#' Format with labels attribute, if present.
#'
#' This is currently only useful in conjuction with
#' \code{\link{pretty_breaks}} applied to date/time data, because 
#' \code{\link{pretty.Date}} returns both the position of the breaks and 
#' their labels as an attribute.
#'
#' If labels are missing, the breaks are formatted with \code{\link{format}}.
#'
#' @export
attr_format <- function() {
  function(x) {
    attr(x, "labels") %||% format(x)
  }
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

