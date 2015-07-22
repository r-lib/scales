# Minimal date time code so no external dependencies needed, and
# we can do the date operations we need.  Need to look at this again once we
# switch to S4 for lubridate.

"%||%" <- function(a, b) if (!is.null(a)) a else b


floor_date <- function(date, time) {
  prec <- parse_unit_spec(time)
  if (prec$unit == "day") {
    structure(round_any(as.numeric(date), prec$mult), class="Date")
  } else {
    as.Date(cut(date, time, right = TRUE, include.lowest = TRUE))
  }
}
floor_time <- function(date, time) {
  to_time <- function(x) {
    force(x)
    structure(x, class = c("POSIXt", "POSIXct"))
  }

  prec <- parse_unit_spec(time)
  if (prec$unit == "sec") {
    to_time(round_any(as.numeric(date), prec$mult))
  } else if (prec$unit == "min") {
    to_time(round_any(as.numeric(date), prec$mult * 60))
  } else {
    as.POSIXct(
      cut(date, time, right = TRUE, include.lowest = TRUE),
      tz = attr(date, "tzone", exact = TRUE) %||% ""
    )
  }
}

ceiling_date <- function(date, time) {
  prec <- parse_unit_spec(time)

  up <- c("day" = 1, "week" = 7, "month" = 31, "year" = 365)
  date <- date + prec$mult * up[prec$unit]

  floor_date(date, time)
}

ceiling_time <- function(date, time) {
  prec <- parse_unit_spec(time)

  up <- c(
    "sec" = 1, "min" = 60, "hour" = 3600,
    c("day" = 1, "week" = 7, "month" = 31, "year" = 365) * 3600 * 24
  )
  date <- date + prec$mult * up[prec$unit]

  floor_time(date, time)
}

parse_unit_spec <- function(unitspec) {
  parts <- strsplit(unitspec, " ")[[1]]
  if (length(parts) == 1) {
    mult <- 1
    unit <- unitspec
  } else {
    mult <- as.numeric(parts[[1]])
    unit <- parts[[2]]
  }
  unit <- gsub("s$", "", unit)

  list(unit = unit, mult = mult)
}
