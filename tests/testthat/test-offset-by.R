test_that("breaks_width() offset supports numeric units", {
  scale_range <- 0:1
  breaks <- breaks_width(1, offset = 0.5)
  expect_equal(breaks(scale_range), c(0.5, 1.5))
})

test_that("breaks_width() with offset supports Date and POSIXt units #247 #269", {
  breaks <- breaks_width("1 year", offset = "3 months")
  compound_breaks <- breaks_width("1 year", offset = c("3 months", "5 days"))

  Date_range <- as.Date(c("2020-01-01", "2020-01-02"))
  POSIXt_range <- as.POSIXct(c("2020-01-01", "2020-01-02"), tz = "UTC")

  # Date
  expect_equal(
    breaks(Date_range),
    as.Date(c("2020-04-01", "2021-04-01"))
  )
  expect_equal(
    compound_breaks(Date_range),
    as.Date(c("2020-04-06", "2021-04-06"))
  )

  # POSIXt
  expect_equal(
    breaks(POSIXt_range),
    as.POSIXct(c("2020-04-01", "2021-04-01"), tz = "UTC")
  )
  expect_equal(
    compound_breaks(POSIXt_range),
    as.POSIXct(c("2020-04-06", "2021-04-06"), tz = "UTC")
  )

  # Fractional seconds
  fractional_seconds <- breaks_width("1 sec", offset = "0.5 secs")
  sec_range <- as.POSIXct(
    c("2020-01-01 00:00:00", "2020-01-01 00:00:01"),
    tz = "UTC"
  )
  expected <- .POSIXct(c(1577836800.5, 1577836801.5, 1577836802.5), tz = "UTC")
  expect_equal(fractional_seconds(sec_range), expected)
})

test_that("breaks_width() with offset supports difftime units #247 #269", {
  secs <- breaks_width("3 mins", offset = "1 sec")
  mins <- breaks_width("3 mins", offset = "1 min")
  hours <- breaks_width("3 hours", offset = "1 hour")
  days <- breaks_width("3 days", offset = "1 day")

  scale_range <- as.difftime(0:1, units = "secs")

  expect_equal(secs(scale_range), as.difftime(c(1, 181), units = "secs"))
  expect_equal(mins(scale_range), as.difftime(c(60, 240), units = "secs"))
  expect_equal(hours(scale_range), as.difftime(c(3600, 14400), units = "secs"))
  expect_equal(days(scale_range), as.difftime(c(86400, 345600), units = "secs"))

  # Compound units
  mins_secs <- breaks_width("1 hour", offset = c("1 min", "1 sec"))
  expect_equal(mins_secs(scale_range), as.difftime(c(61, 3661), units = "secs"))
})
