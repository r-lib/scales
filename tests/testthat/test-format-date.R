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
  expect_equal(time_format()(hms::as.hms(a_time, tz = "UTC")), "11:30:00")
  expect_equal(time_format(format = "%H")(hms::as.hms(a_time, tz = "UTC")), "11")
  expect_equal(time_format()(na_time), NA_character_)
})
