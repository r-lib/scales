context("Trans - dates and times")

a_time <- ISOdatetime(2012, 1, 1, 11, 30, 0, tz = "UTC")
a_date <- as.Date(a_time)

test_that("date/time scales raise error on incorrect inputs", {
  time <- time_trans()
  expect_error(time$trans(a_date), "Invalid input")

  date <- date_trans()
  expect_error(date$trans(a_time), "Invalid input")
  
})