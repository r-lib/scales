test_that("date_format works correctly", {
  a_date <- ISOdate(2012, 1, 1, 11, tz = "UTC")
  na_date <- ISOdate(NA, 1, 1) # date of value NA

  expect_equal(date_format()(a_date), "2012-01-01")
  expect_equal(date_format(format = "%m/%d/%Y")(a_date), "01/01/2012")
  expect_equal(
    date_format(format = "%m/%d/%Y", tz = "Etc/GMT+12")(a_date),
    "12/31/2011"
  )
  expect_equal(date_format()(na_date), NA_character_)
})

test_that("time_format works correctly", {
  a_time <- ISOdatetime(2012, 1, 1, 11, 30, 0, tz = "UTC")
  na_time <- ISOdatetime(NA, 1, 1, 1, 1, 0) # time of value NA

  expect_equal(time_format()(a_time), "11:30:00")
  expect_equal(time_format()(hms::as_hms(a_time)), "11:30:00")
  expect_equal(time_format(format = "%H")(hms::as_hms(a_time)), "11")
  expect_equal(time_format()(na_time), NA_character_)
})

test_that("can set locale", {
  x <- ISOdate(2012, 1, 1, 11, tz = "UTC")
  expect_equal(date_format("%B", locale = "fr")(x), "janvier")
  expect_equal(time_format("%B", locale = "fr")(x), "janvier")
})

test_that("label_date_short can replace leading zeroes", {
  x <- seq(as.Date("2024-01-01"), as.Date("2025-01-01"), by = "1 month")
  labels <- label_date_short(
    format = c("%Y", "%m", "%d"),
    sep = "-",
    leading = "x"
  )(x)
  expect_equal(labels, c("x1-2024", paste0("x", 2:9), c(10:12), "x1-2025"))
})

test_that("label_date_short selects formats in the labeling time zone", {
  x <- as.POSIXct(c("2021-01-01", "2021-02-01"), tz = "Asia/Tokyo")
  format <- c("%Y", "%m", "%d", "%H:%M")
  local_labels <- label_date_short(format = format)
  utc_labels <- label_date_short(format = format, tz = "UTC")

  expect_equal(local_labels(x), c("01\n2021", "02"))
  expect_equal(local_labels(as.POSIXlt(x)), local_labels(x))
  expect_equal(
    utc_labels(x),
    c("15:00\n31\n12\n2020", "15:00\n31\n01\n2021")
  )
  expect_equal(utc_labels(as.POSIXlt(x)), utc_labels(x))
})

test_that("label_date_short preserves POSIXlt wall times in their time zone", {
  x <- strptime("2016-12-31 23:59:60", "%Y-%m-%d %H:%M:%S", tz = "UTC")
  short <- label_date_short(format = c("%Y", "%m", "%d", "%H:%M:%S"))

  expect_equal(short(x), format(x, "%H:%M:%S\n%d\n%m\n%Y"))
})

test_that("localized short date labels use the same zone for fields and output", {
  skip_if_not_installed("stringi")
  x <- as.POSIXct(c("2021-01-01 02:00:00", "2021-02-01 02:00:00"), tz = "UTC")
  labels <- label_date_short(
    format = c("%Y", "%m", "%d", "%H:%M"),
    tz = "GMT+2",
    locale = "en"
  )(x)

  expect_equal(labels, c("04:00\n01\n01\n2021", "04:00\n01\n02"))
})

test_that("date_short doesn't change unexpectedly", {
  expect_snapshot({
    dformat <- label_date_short()

    "dates"
    jan1 <- as.Date("2010-01-01")
    dformat(seq(jan1, length = 8, by = "7 day"))
    dformat(seq(jan1, length = 8, by = "3 month"))
    dformat(seq(jan1, length = 8, by = "1 year"))

    "date-times"
    jan1 <- as.POSIXct("2010-01-01", tz = "UTC")
    dformat(seq(jan1, length = 6, by = "3 hours"))
    dformat(seq(jan1, length = 6, by = "7 day"))
    dformat(seq(jan1, length = 6, by = "3 month"))
    dformat(seq(jan1, length = 6, by = "1 year"))
  })
})
