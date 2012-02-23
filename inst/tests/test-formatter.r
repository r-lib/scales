context("Formatters")

test_that("comma format always adds commas", {
  expect_equal(comma(1e3), "1,000")
  expect_equal(comma(1e6), "1,000,000")
  expect_equal(comma(1e9), "1,000,000,000")
})

test_that("scientific format shows specific sig figs", {
  expect_equal(scientific(123456, digits = 1), "1e+05")
  expect_equal(scientific(123456, digits = 2), "1.2e+05")
  expect_equal(scientific(123456, digits = 3), "1.23e+05")

  expect_equal(scientific(0.123456, digits = 1), "1e-01")
  expect_equal(scientific(0.123456, digits = 2), "1.2e-01")
  expect_equal(scientific(0.123456, digits = 3), "1.23e-01")
})


test_that("formatters don't add extra spaces", {
  has_space <- function(x) any(grepl("\\s", x))
  x <- 10 ^ c(-1, 0, 1, 3, 6, 9)

  expect_false(has_space(comma(x)))
  expect_false(has_space(dollar(x)))
  expect_false(has_space(percent(x)))
  expect_false(has_space(percent(x)))
  expect_false(has_space(scientific(x)))  
})
