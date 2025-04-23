test_that("works with numeric", {
  x <- c(0, 100)
  expected <- c(0, 50, 100)
  expect_equal(fullseq(x, 50), expected)
  expect_equal(fullseq(rev(x), 50), expected)
})

test_that("works with POSIXct", {
  x <- as.POSIXct(c("2000-01-01 08:29:58", "2000-01-01 08:30:10"), tz = "UTC")

  expected <- as.POSIXct(
    c("2000-01-01 8:00:00 UTC", "2000-01-01 9:00:00 UTC"),
    tz = "UTC"
  )
  expect_equal(fullseq(x, "1 hour"), expected)
  expect_equal(fullseq(rev(x), "1 hour"), expected)

  expect_equal(
    fullseq(x, ".5 secs")[1:2],
    as.POSIXct(
      c("2000-01-01 08:29:58.0 UTC", "2000-01-01 08:29:58.5 UTC"),
      tz = "UTC"
    )
  )
})

test_that("works with Date", {
  x <- as.Date("2012-01-01") + c(1, 30)
  expected <- as.Date(c("2012-01-01", "2012-02-01", "2012-03-01"))
  expect_equal(fullseq(x, "1 month"), expected)
  expect_equal(fullseq(rev(x), "1 month"), expected)
})

test_that("works with hms/difftime", {
  x <- hms::hms(hours = 0:1)
  y <- as.difftime(c(0, 1800, 3600), units = "secs")
  expect_equal(fullseq(x, 1800), y)
  expect_equal(fullseq(x, "30 mins"), y)
  expect_equal(fullseq(rev(x), "30 mins"), y)

  # Preserves units
  x <- as.difftime(c(0, 1), units = "hours")
  expect_equal(fullseq(x, 1800), as.difftime(c(0, 0.5, 1), units = "hours"))
})
