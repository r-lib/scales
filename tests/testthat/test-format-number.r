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

# number_si() --------------------------------------------------------

test_that("number_si works", {
  expect_equal(number_si(c(1e3, 1e6, 1e9)), c("1K", "1M", "1B"))
  expect_equal(number_si(c(-1e3, 1e6, 1e9)), c("-1K", "1M", "1B"))
  expect_equal(number_si(c(.50, 1e6, 1e15)), c("0 ", "1M", "1 000T"))
  expect_equal(
    number_si(c(.50, 1e6, 1e9), accuracy = .1, prefix = "$"),
    c("$0.5 ", "$1.0M", "$1.0B")
  )
  expect_equal(
    number_si(c(.50, 100, NA, Inf), accuracy = .1, prefix = "$"),
    c("$0.5 ", "$100.0 ", NA, "Inf")
  )
})

test_that("number_si preserves names", {
  expect_named(number_si(c(a = 1)), "a")
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

# Unit formatter --------------------------------------------------------

test_that("unit format", {
  expect_equal(
    unit_format(unit = "km", scale = 1e-3)(c(1e3, NA, 2e3)),
    c("1.0 km", NA, "2.0 km")
  )
  expect_equal(
    unit_format(unit = "ha", scale = 1e-4, accuracy = .1)(c(1e3, 2e3)),
    c("0.1 ha", "0.2 ha")
  )
  expect_equal(
    unit_format()(c(1e2, 2e2)),
    c("100 m", "200 m")
  )
})

test_that("unit_format preserves names", {
  expect_named(unit_format()(c(a = 1)), "a")
})

# Degree formatter --------------------------------------------------------

test_that("Degree format adds degree symbol", {
  degree <- degree_format()
  expect_equal(degree(c(-10, 0, 20, NA)), c("-10°", "0°", "20°", NA))
})

test_that("Degree format can also add unit symbols", {
  celcius <- degree_format(unit = "C")
  expect_equal(celcius(c(-10, 0, 20)), c("-10°C", "0°C", "20°C"))
})

test_that("degree format preserves names", {
  expect_named(degree_format()(c(a = 1)), "a")
})

# Percent formatter -------------------------------------------------------

test_that("negative percents work", {
  expect_equal(percent(-0.6, accuracy = 1), "-60%")
})

test_that("Single 0 gives 0%", {
  expect_equal(percent(0), "0%")
})

test_that("preserves NAs", {
  expect_equal(percent(c(NA, 1, 2, 3)), c(NA, "100%", "200%", "300%"))
  expect_equal(percent(NA_real_), NA_character_)
})

test_that("preserves names", {
  expect_named(percent(c(a = 1)), "a")
})

test_that("default accuracy works for range of inputs", {
  x <- c(0.1, 0.2, 0.5)
  expect_equal(percent(x / 100), c("0.10%", "0.20%", "0.50%"))
  expect_equal(percent(x / 10), c("1.0%", "2.0%", "5.0%"))
  expect_equal(percent(x), c("10%", "20%", "50%"))
  expect_equal(percent(x * 10), c("100%", "200%", "500%"))
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
