context("Bounds")

test_that("rescale_mid returns correct results", {
  x <- c(-1, 0, 1)
  
  expect_equal(rescale_mid(x), c(0, 0.5, 1))
  expect_equal(rescale_mid(x, mid = -1), c(0.5, 0.75, 1))
  expect_equal(rescale_mid(x, mid = 1), c(0, 0.25, 0.5))
  
  expect_equal(rescale_mid(x, mid = 1, to = c(0, 10)), c(0, 2.5, 5))
  expect_equal(rescale_mid(x, mid = 1, to = c(8, 10)), c(8, 8.5, 9))  
})


test_that("zero range inputs return mid range", {
  expect_that(rescale(0), equals(0.5))
  expect_that(rescale(c(0, 0)), equals(c(0.5, 0.5)))  
})


test_that("censor and squish ignore infinite values", {
  expect_equal(squish(c(1, Inf)), c(1, Inf))
  expect_equal(censor(c(1, Inf)), c(1, Inf))
  
  
})