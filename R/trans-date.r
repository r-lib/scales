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
  trans_new(
    "date", 
    "as.numeric", 
    function(x) structure(x, class = "Date"),
    pretty_breaks(),
    attr_format())
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
  trans_new(
    "time",
    "as.numeric",
    function(x) structure(x, class = c("POSIXt", "POSIXct")),
    pretty_breaks(),
    attr_format())
}

#' Format with labels attribute, if present.
#'
#' This is currently only useful in conjuction with
#' \code{\link{pretty_breaks}} applied to date/time data, because 
#' \code{\link{pretty.breaks}} returns both the position of the breaks and 
#' their labels as an attribute.
#'
#' If labels are missing, the breaks are formatted with \code{\link{format}}.
#'
#' @export
attr_format <- function() {
  function(x) {
    labels <- attr(x, "labels")
    if (!is.null(labels)) labels else format(x)
  }
}

#' Regularly spaced dates.
#' 
#' @param width an interval specification, one of "sec", "min", "hour",
#'   "day", "week", "month", "year". Can be by an integer and a space, or
#'   followed by "s". 
#' @export
date_breaks <- function(width = "1 month") {
  function(x) fullseq_date(x, width)
}

