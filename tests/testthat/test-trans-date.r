context("Trans - dates and times")

a_time <- ISOdatetime(2012, 1, 1, 11, 30, 0, tz = "UTC")
a_date <- as.Date(a_time)

tz <- function(x) attr(as.POSIXlt(x), "tzone")[1]
tz2 <- function(x) format(x, "%Z")

with_tz <- function(x, value) {
  as.POSIXct(format(x, tz = value, usetz = TRUE), tz = value)
}

test_that("date/time scales raise error on incorrect inputs", {
  time <- time_trans()
  expect_error(time$trans(a_date), "Invalid input")

  date <- date_trans()
  expect_error(date$trans(a_time), "Invalid input")
})

test_that("time scales learn timezones", {
  skip_if_not(getRversion() > "3.3.3")
  time <- time_trans()
  x <- time$inv(time$trans(a_time))

  expect_equal(tz(x), "UTC")
  expect_equal(tz2(x), "UTC")

  time <- time_trans()
  x <- time$inv(time$trans(with_tz(a_time, "GMT")))

  expect_equal(tz(x), "GMT")
  expect_equal(tz2(x), "GMT")
})

test_that("tz arugment overrules default time zone", {
  time <- time_trans("GMT")
  x <- time$inv(time$trans(a_time))

  expect_equal(tz(x), "GMT")
  expect_equal(tz2(x), "GMT")
})

test_that("time_format formats hms objects", {
  expect_equal(time_format()(a_time), "11:30:00")
  skip_if_not_installed("hms")
  expect_equal(time_format()(hms::as.hms(a_time, tz = tz(a_time))), "11:30:00")
  expect_equal(time_format(format = "%H")(hms::as.hms(a_time, tz = tz(a_time))), "11")
})
