#' Label date/times
#'
#' `label_date()` and `label_time()` label date/times using date/time format
#' strings. `label_date_short()` automatically constructs a short format string
#' suffiicient to uniquely identify labels. It's inspired by matplotlib's
#' [`ConciseDateFormatter`](https://matplotlib.org/api/dates_api.html#matplotlib.dates.ConciseDateFormatter),
#' but uses a slightly different approach: `ConciseDateFormatter` formats
#' "firsts" (e.g. first day of month, first day of day) specially;
#' `date_short()` formats changes (e.g. new month, new year) specially.
#'
#' @section Old interface:
#' `date_format()` and `time_format()` are retired; please use `label_date()`
#' and `label_time()` instead.
#' @inherit number_format return params
#' @param format For `date_format()` and `time_format()` a date/time format
#'   string using standard POSIX specification.  See [strptime()] for details.
#'
#'   For `date_short()` a character vector of length 4 giving the format
#'   components to use for year, month, day, and hour respectively.
#' @param tz a time zone name, see [timezones()]. Defaults
#'  to UTC
#' @export
#' @examples
#' date_range <- function(start, days) {
#'   start <- as.POSIXct(start)
#'   c(start, start + days * 24 * 60 * 60)
#' }
#'
#' two_months <- date_range("2020-05-01", 60)
#' demo_datetime(two_months)
#' demo_datetime(two_months, labels = date_format("%m/%d"))
#' # ggplot2 provides a short-hand:
#' demo_datetime(two_months, date_labels = "%m/%d")
#'
#' # An alternative labelling system is label_date_short()
#' demo_datetime(two_months, date_breaks = "7 days", labels = label_date_short())
#' # This is particularly effective for dense labels
#' one_year <- date_range("2020-05-01", 365)
#' demo_datetime(one_year, date_breaks = "month")
#' demo_datetime(one_year, date_breaks = "month", labels = label_date_short())
label_date <- function(format = "%Y-%m-%d", tz = "UTC") {
  force_all(format, tz)
  function(x) format(x, format, tz = tz) # format handles NAs correctly when dealing with dates
}

#' @export
#' @rdname label_date
#' @param sep Separator to use when combining date formats into a single string.
label_date_short <- function(format = c("%Y", "%b", "%d", "%H:%M"), sep = "\n") {
  force_all(format, sep)

  function(x) {
    dt <- unclass(as.POSIXlt(x))

    changes <- cbind(
      year = changed(dt$year),
      month = changed(dt$mon),
      day = changed(dt$mday)
    )
    # Ensure large unit changes implies that small units change too
    # Would be more elegant with cumany() but cumsum() does the job
    changes <- t(apply(changes, 1, cumsum)) >= 1

    # Trim out "firsts" from smallest to largest - only want to trim (e.g.)
    # January if all dates are the first of the month.
    if (inherits(x, "Date") || all(dt$hour == 0 & dt$min == 0, na.rm = TRUE)) {
      format[[4]] <- NA

      if (all(dt$mday == 1, na.rm = TRUE)) {
        format[[3]] <- NA

        if (all(dt$mon == 0, na.rm = TRUE)) {
          format[[2]] <- NA
        }
      }
    }

    for_mat <- cbind(
      ifelse(changes[, 1], format[[1]], NA),
      ifelse(changes[, 2], format[[2]], NA),
      ifelse(changes[, 3], format[[3]], NA),
      format[[4]]
    )

    format <- apply(for_mat, 1, function(x) paste(rev(x[!is.na(x)]), collapse = sep))
    format(x, format)
  }
}

changed <- function(x) c(TRUE, is.na(x[-length(x)]) | x[-1] != x[-length(x)])
append_if <- function(x, cond, value) {
  x[cond] <- lapply(x[cond], c, value)
  x
}


#' @export
#' @rdname label_date
label_time <- function(format = "%H:%M:%S", tz = "UTC") {
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


#' @export
#' @rdname label_date
date_format <- label_date

#' @export
#' @rdname label_date
time_format <- label_time
