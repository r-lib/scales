test_that("date_format works correctly", {
  a_date <- ISOdate(2012, 1, 1, 11, tz = "UTC")
  na_date <- ISOdate(NA, 1, 1) # date of value NA

  expect_equal(date_format()(a_date), "2012-01-01")
  expect_equal(date_format(format = "%m/%d/%Y")(a_date), "01/01/2012")
  expect_equal(date_format(format = "%m/%d/%Y", tz = "Etc/GMT+12")(a_date), "12/31/2011")
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

test_that("date_short doesn't change unexpectedly", {
  verify_output(test_path("test-label-date-short.txt"), {
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
