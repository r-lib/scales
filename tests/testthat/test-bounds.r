context("Bounds")

test_that("rescale_mid returns correct results", {
  x <- c(-1, 0, 1)

  expect_equal(rescale_mid(x), c(0, 0.5, 1))
  expect_equal(rescale_mid(x, mid = -1), c(0.5, 0.75, 1))
  expect_equal(rescale_mid(x, mid = 1), c(0, 0.25, 0.5))

  expect_equal(rescale_mid(x, mid = 1, to = c(0, 10)), c(0, 2.5, 5))
  expect_equal(rescale_mid(x, mid = 1, to = c(8, 10)), c(8, 8.5, 9))

  expect_equal(rescale_mid(c(1, NA, 1)), c(0.5, NA, 0.5))
})

test_that("rescale_max returns correct results", {
  expect_equal(rescale_max(0), NaN)
  expect_equal(rescale_max(1), 1)
  expect_equal(rescale_max(.3), 1)
  expect_equal(rescale_max(c(4, 5)), c(0.8, 1.0))
  expect_equal(rescale_max(c(-3, 0, -1, 2)), c(-1.5, 0, -0.5, 1))
  expect_equal(rescale_max(c(-3, 0, -1, 2)), c(-1.5, 0, -0.5, 1))
})

test_that("rescale functions handle NAs consistently", {
  expect_equal(rescale(c(2, NA, 0, -2)), c(1, NA, 0.5, 0))
  expect_equal(rescale(c(-2, NA, -2)), c(.5, NA, .5))

  expect_equal(rescale_mid(c(NA, 1, 2)), c(NA, 0.75, 1))
  expect_equal(rescale_mid(c(2, NA, 0, -2), mid = .5), c(0.8, NA, 0.4, 0))
  expect_equal(rescale_mid(c(-2, NA, -2)), c(.5, NA, .5))

  expect_equal(rescale_max(c(1, NA)), c(1, NA))
  expect_equal(rescale_max(c(2, NA, 0, -2)), c(1, NA, 0, -1))
  expect_equal(rescale_max(c(-2, NA, -2)), c(1, NA, 1))
})

test_that("zero range inputs return mid range", {
  expect_that(rescale(0), equals(0.5))
  expect_that(rescale(c(0, 0)), equals(c(0.5, 0.5)))
})


test_that("censor and squish ignore infinite values", {
  expect_equal(squish(c(1, Inf)), c(1, Inf))
  expect_equal(censor(c(1, Inf)), c(1, Inf))
})

test_that("scaling is possible with dates and times", {
  dates <- as.Date(c("2010-01-01", "2010-01-03", "2010-01-05", "2010-01-07"))
  expect_equal(rescale(dates, from = c(dates[1], dates[4])), seq(0, 1, 1 / 3))
  expect_equal(rescale_mid(dates, mid = dates[3])[3], 0.5)

  dates <- as.POSIXct(c(
    "2010-01-01 01:40:40",
    "2010-01-01 03:40:40",
    "2010-01-01 05:40:40",
    "2010-01-01 07:40:40"
  ))
  expect_equal(rescale(dates, from = c(dates[1], dates[4])), seq(0, 1, 1 / 3))
  expect_equal(rescale_mid(dates, mid = dates[3])[3], 0.5)
})

test_that("scaling is possible with integer64 data", {
  skip_if_not_installed("bit64")
  x <- bit64::as.integer64(2^60) + c(0:3)
  expect_equal(
    rescale_mid(x, mid = bit64::as.integer64(2^60) + 1),
    c(0.25, 0.5, 0.75, 1)
  )
})

test_that("scaling is possible with NULL values", {
  expect_null(rescale(NULL))
  expect_null(rescale_mid(NULL))
})

test_that("scaling is possible with logical values", {
  expect_equal(rescale(c(FALSE, TRUE)), c(0, 1))
  expect_equal(rescale_mid(c(FALSE, TRUE), mid = 0.5), c(0, 1))
})

test_that("expand_range respects mul and add values", {
  expect_equal(expand_range(c(1,1), mul = 0, add = 0.6), c(0.4, 1.6))
  expect_equal(expand_range(c(1,1), mul = 1, add = 0.6), c(-0.6, 2.6))
  expect_equal(expand_range(c(1,9), mul = 0, add = 2), c(-1, 11))
})

