# Number formatter --------------------------------------------------------

test_that("number format works correctly", {
  expect_equal(number(123.45, accuracy = 1), "123")
  expect_equal(number(123.45, accuracy = 10), "120")
  expect_equal(number(123.45, accuracy = .25), "123.5")
  expect_equal(
    number(12345, big.mark = ","),
    "12,345"
  )
  expect_equal(
    number(12.3, decimal.mark = ",", accuracy = .1),
    "12,3"
  )
  expect_equal(
    number(1.234, scale = 100),
    "123"
  )
  expect_equal(
    number(123, prefix = "pre", suffix = "post"),
    "pre123post"
  )
  expect_equal(number(c(1, 23)), c("1", "23"))
  expect_equal(number(c(1, 23), trim = FALSE), c(" 1", "23"))
})

test_that("number_format works with Inf", {
  cust <- number_format(suffix = "suff", accuracy = NULL)
  expect_equal(cust(c(Inf, -Inf)), c("Inf", "-Inf"))
})

test_that("number preserves names", {
  expect_named(number(c(a = 1)), "a")
})

# Comma formatter --------------------------------------------------------

test_that("comma format always adds commas", {
  expect_equal(comma(1e3), "1,000")
  expect_equal(comma(1e6), "1,000,000")
  expect_equal(comma(1e9), "1,000,000,000")
})

test_that("comma preserves names", {
  expect_named(comma(c(a = 1)), "a")
})

# Common tests --------------------------------------------------------

test_that("formatters don't add extra spaces", {
  has_space <- function(x) any(grepl("\\s", x))
  x <- 10^c(-1, 0, 1, 3, 6, 9)

  expect_false(has_space(number(x, big.mark = ",")))
  expect_false(has_space(comma(x)))
  expect_false(has_space(dollar(x)))
  expect_false(has_space(percent(x, big.mark = ",")))
  expect_false(has_space(scientific(x)))
})

test_that("formats work with 0 length input", {
  x <- numeric()
  expected <- character()
  expect_identical(number(x), expected)
  expect_identical(comma(x), expected)
  expect_identical(dollar(x), expected)
  expect_identical(percent(x), expected)
  expect_identical(scientific(x), expected)
  expect_identical(comma_format()(x), expected)
  expect_identical(date_format()(as.Date(character(0))), expected)
  expect_identical(dollar_format()(x), expected)
  expect_identical(parse_format()(x), expression())
  expect_identical(parse_format()(character()), expression())
  expect_identical(percent_format()(x), expected)
  expect_identical(scientific_format()(x), expected)
  expect_identical(trans_format(identity)(x), expected)
})

# precision ---------------------------------------------------------------

test_that("precision rounds large numbers appropriately", {
  x <- c(0, 0.025)
  expect_equal(precision(x), 0.001)
  expect_equal(precision(x * 10), 0.01)
  expect_equal(precision(x * 100), 0.1)
  expect_equal(precision(x * 1000), 1)
  expect_equal(precision(x * 10000), 1)
})

test_that("precision handles duplicate values", {
  expect_equal(precision(c(0, 0, 0.025)), 0.001)
  expect_equal(precision(c(Inf, 0.1, 0.2, Inf)), 0.01)
})

test_that("precision ignores Inf and NA", {
  expect_equal(precision(c(NA, Inf, -Inf)), 1)
  expect_equal(precision(c(1, NA)), 1)
})
