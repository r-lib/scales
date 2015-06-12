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

test_that("wrap correctly wraps long lines", {
  expect_equal(wrap_format(10)("this is a long line"),
               "this is a\nlong line")
  expect_equal(wrap_format(10)(c("this is a long line", "this is another long line")),
               c("this is a\nlong line", "this is\nanother\nlong line"))
  expect_equal(wrap_format(10)("a_very_long_word_without_spaces"),
               "a_very_long_word_without_spaces")
  expect_equal(wrap_format(10)("short line"), "short\nline")
  expect_equal(wrap_format(15)("short line"), "short line")
})

test_that("ordinal format", {
  expect_equal(ordinal(1),  "1st")
  expect_equal(ordinal(2),  "2nd")
  expect_equal(ordinal(3),  "3rd")
  expect_equal(ordinal(4),  "4th")
  expect_equal(ordinal(11), "11th")
  expect_equal(ordinal(12), "12th")
  expect_equal(ordinal(21), "21st")
})

test_that("ordinal format maintains order", {
  expect_equal(ordinal(c(21, 1, 11)), c("21st", "1st", "11th"))
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

test_that("formats work with 0 length input", {
  x <- numeric()
  expected <- character()
  expect_identical(comma(x), expected)
  expect_identical(dollar(x), expected)
  expect_identical(percent(x), expected)
  expect_identical(scientific(x), expected)
  expect_identical(comma_format()(x), expected)
  expect_identical(date_format()(as.Date(character(0))), expected)
  expect_identical(dollar_format()(x), expected)
  expect_identical(math_format()(x), list())
  expect_identical(parse_format()(x), list())
  expect_identical(percent_format()(x), expected)
  expect_identical(scientific_format()(x), expected)
  expect_identical(trans_format(identity)(x), expected)
})

test_that("unit format", {
  expect_equal(
    unit_format(unit = "km", scale = 1e-3)(c(1e3, 2e3)),
    c("1 km", "2 km")
  )
  expect_equal(
    unit_format(unit = "ha", scale = 1e-4)(c(1e3, 2e3)),
    c("0.1 ha", "0.2 ha")
  )
  expect_equal(
    unit_format()(c(1e3, 2e3)),
    c("1,000 m", "2,000 m")
  )
})


# Percent formatter -------------------------------------------------------

test_that("negative percents work", {
  expect_equal(percent(-0.6), "-60%")
})

# Dollar formatter --------------------------------------------------------

test_that("negative comes before prefix", {
  expect_equal(dollar(-1), "$-1")
})

test_that("missing values preserved", {
  expect_equal(dollar(NA_real_), "$NA")
})
