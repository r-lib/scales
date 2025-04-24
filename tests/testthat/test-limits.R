test_that("limits_include gives expected results", {
  x <- limits_include(2)(c(-5, -1))
  expect_equal(x, c(-5, 2))

  x <- limits_include(-2)(c(5, 1))
  expect_equal(x, c(-2, 5))
})

test_that("limits_center gives expected results", {
  x <- limits_center(-1)(c(0, 1))
  expect_equal(x, c(-3, 1))

  x <- limits_center(1)(c(0, 1))
  expect_equal(x, c(0, 2))
})
