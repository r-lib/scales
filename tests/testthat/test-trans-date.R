a_time <- ISOdatetime(2012, 1, 1, 11, 30, 0, tz = "UTC")
a_date <- as.Date(a_time)

tz <- function(x) attr(as.POSIXlt(x), "tzone")[1]
tz2 <- function(x) format(x, "%Z")

with_tz <- function(x, value) {
  as.POSIXct(format(x, tz = value, usetz = TRUE), tz = value)
}

test_that("date/time scales raise error on incorrect inputs", {
  time <- transform_time()
  expect_snapshot_error(time$transform(a_date))

  date <- transform_date()
  expect_snapshot_error(date$transform(a_time))
})

test_that("time scales learn timezones", {
  skip_if_not(getRversion() > "3.3.3")
  time <- transform_time()
  x <- time$inverse(time$transform(a_time))

  expect_equal(tz(x), "UTC")
  expect_equal(tz2(x), "UTC")

  time <- transform_time()
  x <- time$inverse(time$transform(with_tz(a_time, "GMT")))

  expect_equal(tz(x), "GMT")
  expect_equal(tz2(x), "GMT")
})

test_that("tz arugment overrules default time zone", {
  time <- transform_time("GMT")
  x <- time$inverse(time$transform(a_time))

  expect_equal(tz(x), "GMT")
  expect_equal(tz2(x), "GMT")
})

test_that("date_breaks() works", {
  times <- as.POSIXct(c("2000-01-01 08:29:58", "2000-01-01 08:30:10"), tz = "UTC")

  expect_equal(
    date_breaks("1 hour")(times),
    as.POSIXct(c("2000-01-01 8:00:00 UTC", "2000-01-01 9:00:00 UTC"), tz = "UTC")
  )
  expect_equal(
    date_breaks(".5 secs")(times)[1:2],
    as.POSIXct(c("2000-01-01 08:29:58.0 UTC", "2000-01-01 08:29:58.5 UTC"), tz = "UTC")
  )

  dates <- a_date + 1:30
  expect_equal(
    date_breaks("1 month")(dates),
    as.Date(c("2012-01-01", "2012-02-01"))
  )
})

test_that("can invert domain", {
  t <- transform_date()
  expect_equal(t$transform(t$domain), c(-Inf, Inf))

  t <- transform_time()
  expect_equal(t$transform(t$domain), c(-Inf, Inf))
})
