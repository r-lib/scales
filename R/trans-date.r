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
    stop("Invalid input: date_trans works with objects of class Date only",
      call. = FALSE
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
      stop("Invalid input: time_trans works with objects of class ",
        "POSIXct only",
        call. = FALSE
      )
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
#' @export
#' @examples
#' if (require("hms")) {
#'   hms <- round(runif(10) * 86400)
#'   t <- hms_trans()
#'   t$transform(hms)
#'   t$inverse(t$transform(hms))
#'   t$breaks(hms)
#' }
hms_trans <- function() {
  trans_new(
    "hms",
    transform = function(x) {
      structure(as.numeric(x), names = names(x))
    },
    inverse = hms::as_hms,
    breaks = time_breaks()
  )
}

time_breaks <- function(n = 5) {
  force(n)
  function(x) {
    rng <- as.numeric(range(x))
    diff <- rng[2] - rng[1]

    if (diff <= 2 * 60) {
      scale <- 1
    } else if (diff <= 2 * 3600) {
      scale <- 60
    } else if (diff <= 2 * 86400) {
      scale <- 3600
    } else {
      scale <- 86400
    }

    rng <- rng / scale
    breaks <- labeling::extended(
      rng[1], rng[2], n,
      Q = c(1, 2, 1.5, 4, 3),
      only.loose = FALSE
    )
    hms::as_hms(breaks * scale)
  }
}
