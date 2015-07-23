context("rescale")

test_that("rescale preserves NAs even when x has zero range", {
  expect_equal(rescale(c(1, NA)), c(0.5, NA))
})
