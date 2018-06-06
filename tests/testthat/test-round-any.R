context("round_any")

test_that("round_any function rounds numeric", {
  expect_equal(round_any(135, 10), 140)
  expect_equal(round_any(135, 100), 100)
  expect_equal(round_any(135, 25), 125)
  expect_equal(round_any(135, 10, floor), 130)
  expect_equal(round_any(135, 100, floor), 100)
  expect_equal(round_any(135, 25, floor), 125)
  expect_equal(round_any(135, 10, ceiling), 140)
  expect_equal(round_any(135, 100, ceiling), 200)
  expect_equal(round_any(135, 25, ceiling), 150)
})

test_that("round_any() function rounds POSIXct", {
  expect_equal(
    round_any(as.POSIXct("2000-01-01 11:00:00", tz = "UTC"), 86400),
    as.POSIXct("2000-01-01", tz = "UTC")
  )
  expect_equal(
    round_any(as.POSIXct("2000-01-01 11:11:11", tz = "UTC"), 3600),
    as.POSIXct("2000-01-01 11:00", tz = "UTC")
  )
  expect_equal(
    round_any(as.POSIXct("2000-01-01 11:11:11", tz = "UTC"), 10, ceiling),
    as.POSIXct("2000-01-01 11:11:20", tz = "UTC")
  )
})
