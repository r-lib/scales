context("Zero range")

test_that("large numbers with small differences", {
  x <- c(1330020857.8787, 1330020866.8787)
  expect_false(zero_range(x))

  x <- c(1330020857.8787, 1330020857.8787)
  expect_true(zero_range(x))
}) 