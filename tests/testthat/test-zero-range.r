context("Zero range")

test_that("large numbers with small differences", {
  expect_false(zero_range(c(1330020857.8787, 1330020866.8787)))
  expect_true(zero_range(c(1330020857.8787, 1330020857.8787)))
})

test_that("small numbers with differences on order of values", {
  expect_false(zero_range(c(5.63e-147, 5.93e-123)))
  expect_false(zero_range(c(-7.254574e-11, 6.035387e-11)))
  expect_false(zero_range(c(-7.254574e-11, -6.035387e-11)))
})

test_that("ranges with 0 endpoint(s)", {
  expect_false(zero_range(c(0, 10)))
  expect_true(zero_range(c(0, 0)))
  expect_false(zero_range(c(-10, 0)))
  expect_false(zero_range(c(0, 1) * 1e-100))
  expect_false(zero_range(c(0, 1) * 1e+100))
})

test_that("symmetric ranges", {
  expect_false(zero_range(c(-1, 1)))
  expect_false(zero_range(c(-1, 1 * (1 + 1e-20))))
  expect_false(zero_range(c(-1, 1) * 1e-100))
})

test_that("length 1 ranges", {
  expect_true(zero_range(c(1)))
  expect_true(zero_range(c(0)))
  expect_true(zero_range(c(1e100)))
  expect_true(zero_range(c(1e-100)))
})

test_that("NA and Inf", {
  # Should return NA
  expect_true(is.na(zero_range(c(NA, NA))))
  expect_true(is.na(zero_range(c(1, NA))))
  expect_true(is.na(zero_range(c(1, NaN))))

  # Not zero range
  expect_false(zero_range(c(1, Inf)))
  expect_false(zero_range(c(-Inf, Inf)))

  # Can't know if these are truly zero range
  expect_true(zero_range(c(Inf, Inf)))
  expect_true(zero_range(c(-Inf, -Inf)))
})

test_that("Tolerance", {
  # By default, tolerance is 1000 times this
  eps <- .Machine$double.eps

  expect_true(zero_range(c(1, 1 + eps)))
  expect_true(zero_range(c(1, 1 + 99 * eps)))

  # Cross the threshold
  expect_false(zero_range(c(1, 1 + 1001 * eps)))
  expect_false(zero_range(c(1, 1 + 2 * eps), tol = eps))

  # Scaling up or down all the values has no effect since the values
  # are rescaled to 1 before checking against tol
  expect_true(zero_range(100000 * c(1, 1 + eps)))
  expect_true(zero_range(.00001 * c(1, 1 + eps)))
  expect_true(zero_range(100000 * c(1, 1 + 99 * eps)))
  expect_true(zero_range(.00001 * c(1, 1 + 99 * eps)))
  expect_false(zero_range(100000 * c(1, 1 + 1001 * eps)))
  expect_false(zero_range(.00001 * c(1, 1 + 1001 * eps)))
})
