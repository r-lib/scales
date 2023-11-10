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

test_that("can control positive and negative styles", {
  expect_equal(number(1, style_positive = "none"), "1")
  expect_equal(number(1, style_positive = "plus"), "+1")
  expect_equal(number(-1, style_negative = "hyphen"), "-1")
  expect_equal(number(-1, style_negative = "minus"), "\u22121")
  expect_equal(number(-1, style_negative = "parens"), "(1)")
})

test_that("prefix applied before negative format", {
  expect_equal(number(-1, prefix = "$"), "-$1")
  expect_equal(number(-1, prefix = "$", style_negative = "parens"), "($1)")
})

test_that("accuracy is vectorised", {
  expect_equal(
    number(rep(0.1234, 4), accuracy = 10^(0:-3)),
    c("0", "0.1", "0.12", "0.123")
  )
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

test_that("precision is reduced when possible", {
  expect_equal(precision(c(0, 0.01)), 0.01)
  expect_equal(precision(c(0, 0.011)), 0.001)
  expect_equal(precision(c(0, 0.0101)), 0.01)
  expect_equal(precision(c(0, 0.0109)), 0.001)

  expect_equal(precision(c(0.251, 0.351)), 0.01)
})

test_that("precision handles duplicate values", {
  expect_equal(precision(c(0, 0, 0.025)), 0.001)
  expect_equal(precision(c(Inf, 0.1, 0.2, Inf)), 0.1)
})

test_that("precision ignores Inf and NA", {
  expect_equal(precision(c(NA, Inf, -Inf)), 1)
  expect_equal(precision(c(1, NA)), 1)
})


# scale_cut ---------------------------------------------------------------

test_that("accuracy computed on individual scales", {
  x <- c(0, 250, 500, 750, 1250, 1500) * 1e3
  expect_equal(
    number(x, scale_cut = cut_short_scale()),
    c("0", "250K", "500K", "750K", "1.25M", "1.50M")
  )
})

test_that("zero and special values don't get units", {
  x <- c(0, NA, Inf, -Inf)
  expect_equal(
    number(x, scale_cut = cut_short_scale()),
    c("0", NA, "Inf", "-Inf")
  )
})

test_that("scale applied before scale_cut", {
  expect_equal(number(500, scale = 2, scale_cut = cut_short_scale()), "1K")
  expect_equal(
    number(c(0, 5e5, 1.2e6), scale = 1/1000, scale_cut = cut_short_scale()),
    c("0", "500", "1K")
  )
})

test_that("cut_si() adds space before unit", {
  skip_if_not(getRversion() >= "3.5")
  expect_equal(number(c(0, 1, 1000), scale_cut = cut_si("m")), c("0 m", "1 m", "1 km"))
})

test_that("handles out-of-range inputs", {
  expect_equal(number(1e15, scale_cut = cut_short_scale()), "1 000T")
})

test_that("short and long scale can add spaces", {
  expect_equal(number(1000, scale_cut = cut_short_scale(TRUE)), "1 K")
  expect_equal(number(1000, scale_cut = cut_long_scale(TRUE)), "1 K")
})

test_that("scale_cut checks its inputs", {
  expect_snapshot(error = TRUE, {
    number(1, scale_cut = 0)
    number(1, scale_cut = "x")
    number(1, scale_cut = c(x = 0, NA))
  })
})

test_that("scale_cut prefers clean cuts", {
  x <- c(518400, 691200)
  # prefers days over week in second element
  expect_equal(number(x, scale_cut = cut_time_scale()), c("6d", "8d"))
})

test_that("built-in functions return expected values", {
  skip_if_not(getRversion() >= "3.5")

  expect_equal(number(1e9, scale_cut = cut_short_scale()), "1B")
  expect_equal(number(1e9, scale_cut = cut_long_scale()), "1 000M")
  expect_equal(number(1e9, scale_cut = cut_si("m")), "1 Gm")
})
