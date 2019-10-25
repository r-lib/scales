#' Formatted dates and times.
#'
#' @param format Date/time format using standard POSIX specification.  See
#'  [strptime()] for possible formats.
#' @param tz a time zone name, see [timezones()]. Defaults
#'  to UTC
#' @export
#' @examples
#' a_time <- ISOdatetime(2012, 1, 1, 11, 30, 0, tz = "UTC")
#' a_date <- as.Date(a_time)
#'
#' date_format()(a_date)
#' date_format(format = "%A")(a_date)
#'
date_format <- function(format = "%Y-%m-%d", tz = "UTC") {
  force_all(format, tz)
  function(x) format(x, format, tz = tz) # format handles NAs correctly when dealing with dates
}

#' @export
#' @rdname date_format
#' @examples
#' time_format()(a_time)
#' time_format(tz = "Europe/Berlin")(a_time)
#'
#' a_hms <- hms::as.hms(a_time, tz = "UTC")
#' time_format(format = "%H:%M")(a_hms)
time_format <- function(format = "%H:%M:%S", tz = "UTC") {
  force_all(format, tz)
  function(x) {
    if (inherits(x, "POSIXt")) {
      format(x, format = format, tz = tz) # format handles NAs correctly for times
    } else if (inherits(x, "difftime")) {
      format(as.POSIXct(x), format = format, tz = tz)
    } else {
      stop(
        "time_format can't be used with objects of class ", paste(class(x), collapse = "/"),
        ".",
        call. = FALSE
      )
    }
  }
}
