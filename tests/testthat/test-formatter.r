context("Formatters")

# Date formatter --------------------------------------------------------

test_that("date_format works correctly", {
  a_date <- ISOdate(2012, 1, 1, 11, tz = "UTC")
  na_date <- ISOdate(NA, 1, 1) # date of value NA

  expect_equal(date_format()(a_date), "2012-01-01")
  expect_equal(date_format(format = "%m/%d/%Y")(a_date), "01/01/2012")
  expect_equal(date_format(format = "%m/%d/%Y", tz = "Etc/GMT+12")(a_date), "12/31/2011")
  expect_equal(date_format()(na_date), NA_character_)
})


# Time formatter --------------------------------------------------------

test_that("time_format works correctly", {
  a_time <- ISOdatetime(2012, 1, 1, 11, 30, 0, tz = "UTC")
  na_time <- ISOdatetime(NA, 1, 1, 1, 1, 0) # time of value NA

  expect_equal(time_format()(a_time), "11:30:00")
  expect_equal(time_format()(hms::as.hms(a_time, tz = "UTC")), "11:30:00")
  expect_equal(time_format(format = "%H")(hms::as.hms(a_time, tz = "UTC")), "11")
  expect_equal(time_format()(na_time), NA_character_)
})


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

# Comma formatter --------------------------------------------------------

test_that("comma format always adds commas", {
  expect_equal(comma(1e3), "1,000")
  expect_equal(comma(1e6), "1,000,000")
  expect_equal(comma(1e9), "1,000,000,000")
})

# Scientific formatter --------------------------------------------------------

test_that("scientific format shows specific sig figs", {
  expect_equal(scientific(123456, digits = 1), "1e+05")
  expect_equal(scientific(123456, digits = 2), "1.2e+05")
  expect_equal(scientific(123456, digits = 3), "1.23e+05")

  expect_equal(scientific(0.123456, digits = 1), "1e-01")
  expect_equal(scientific(0.123456, digits = 2), "1.2e-01")
  expect_equal(scientific(0.123456, digits = 3), "1.23e-01")
})

test_that("prefix and suffix works with scientific format", {
  expect_equal(scientific(123456, digits = 2, prefix = "V="), "V=1.2e+05")
  expect_equal(scientific(123456, digits = 2, suffix = " km"), "1.2e+05 km")
})

test_that("scale works with scientific format", {
  expect_equal(scientific(123456, digits = 2, scale = 1000), "1.2e+08")
})

test_that("decimal.mark works with scientific format", {
  expect_equal(scientific(123456, digits = 2, decimal.mark = ","), "1,2e+05")
})

test_that("scientific format respects NAs", {
  expect_equal(scientific(NA), NA_character_)
})


# Wrap formatter --------------------------------------------------------

test_that("wrap correctly wraps long lines", {
  expect_equal(
    wrap_format(10)("this is a long line"),
    "this is a\nlong line"
  )
  expect_equal(
    wrap_format(10)(c("this is a long line", "this is another long line")),
    c("this is a\nlong line", "this is\nanother\nlong line")
  )
  expect_equal(
    wrap_format(10)("a_very_long_word_without_spaces"),
    "a_very_long_word_without_spaces"
  )
  expect_equal(wrap_format(10)("short line"), "short\nline")
  expect_equal(wrap_format(15)("short line"), "short line")
})

# Ordinal formatter --------------------------------------------------------

test_that("ordinal format in English", {
  expect_equal(
    ordinal_format()(1:4),
    c("1st", "2nd", "3rd", "4th")
  )
  expect_equal(ordinal(1), "1st")
  expect_equal(ordinal(2), "2nd")
  expect_equal(ordinal(3), "3rd")
  expect_equal(ordinal(4), "4th")
  expect_equal(ordinal(11), "11th")
  expect_equal(ordinal(12), "12th")
  expect_equal(ordinal(21), "21st")
  expect_equal(ordinal(101), "101st")
  expect_equal(ordinal(NA), NA_character_)
})

test_that("ordinal match rules in order", {
  custom <- list(
    a = "^1",
    b = ".",
    c = "^3"
  )
  expect_equal(
    ordinal(1:3, rules = custom),
    c("1a", "2b", "3b")
  )
})

test_that("ordinal format maintains order", {
  expect_equal(ordinal(c(21, 1, NA, 11)), c("21st", "1st", NA, "11th"))
})

# parse formatter ---------------------------------------------------------

test_that("parse format returns an expression object", {
  expect_equal(
    parse_format()(c("alpha", "beta", "gamma")),
    expression(alpha, beta, gamma)
  )

  expect_equal(
    parse_format()(1:5),
    expression(1, 2, 3, 4, 5)
  )
})


# Unit formatter --------------------------------------------------------

test_that("unit format", {
  expect_equal(
    unit_format(unit = "km", scale = 1e-3)(c(1e3, NA, 2e3)),
    c("1 km", NA, "2 km")
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


# Degree formatter --------------------------------------------------------

test_that("Degree format adds degree symbol", {
  degree <- degree_format()
  expect_equal(degree(c(-10, 0, 20, NA)), c("-10°", "0°", "20°", NA))
})

test_that("Degree format can also add unit symbols", {
  celcius <- degree_format(unit = "C")
  expect_equal(celcius(c(-10, 0, 20)), c("-10°C", "0°C", "20°C"))
})


# Percent formatter -------------------------------------------------------

test_that("negative percents work", {
  expect_equal(percent(-0.6, accuracy = 1), "-60%")
})

test_that("Single 0 gives 0%", {
  expect_equal(percent(0), "0%")
})

test_that("NAs are preserved", {
  expect_equal(percent(c(NA, 1, 2, 3)), c(NA, "100%", "200%", "300%"))
})

test_that("Single NA gives NA", {
  expect_equal(percent(NA_real_), NA_character_)
})


# Dollar formatter --------------------------------------------------------

test_that("negative comes before prefix", {
  expect_equal(dollar(-1), "$-1")
})

test_that("prefix is inside parentheses", {
  expect_equal(dollar(-1, negative_parens = TRUE), "($1)")
})

test_that("missing values preserved", {
  expect_equal(dollar(NA_real_), NA_character_)
})

test_that("decimal.mark could be modified", {
  expect_equal(dollar(123.45, decimal.mark = ","), "$123,45")
})

# p-value formatter --------------------------------------------------------

test_that("pvalue formatter works", {
  expect_equal(
    pvalue(c(.5, .045, .0002, NA)),
    c("0.500", "0.045", "<0.001", NA)
  )
  expect_equal(
    pvalue(c(.5, .045, .0002, NA), accuracy = .01),
    c("0.50", "0.04", "<0.01", NA)
  )
  expect_equal(
    pvalue(c(.5, .045, .0002, NA), decimal.mark = ","),
    c("0,500", "0,045", "<0,001", NA)
  )
  expect_equal(
    pvalue(c(.5, .045, .0002, NA), add_p = TRUE),
    c("p=0.500", "p=0.045", "p<0.001", "p=NA")
  )
})

# Byte formatter -----------------------------------------------------

test_that("Byte formatter can take a symbol designator", {
  expect_equal(
    number_bytes(c(50, 400, 502, NA), symbol = "B"),
    c("50 B", "400 B", "502 B", NA)
  )
  expect_equal(
    number_bytes(c(3e6, 4e6, 5e6), symbol = "MiB"),
    c("3 MiB", "4 MiB", "5 MiB")
  )
  expect_equal(
    number_bytes(1000^(1:3), symbol = "kB", units = "si"),
    c("1 kB", "1 000 kB", "1 000 000 kB")
  )

  # informative warning for incorrect spelling
  expect_warning(number_bytes(c(50, 400, 502, NA), symbol = "k"), "must be")

  # respects unit designation
  expect_equal(number_bytes(1024, accuracy = .01), c("1.00 KiB"))
  expect_equal(number_bytes(1024, units = "si", accuracy = .01), c("1.02 kB"))
  expect_equal(number_bytes(1000, units = "si", accuracy = .01), c("1.00 kB"))

  # takes parameters from number()
  expect_equal(
    number_bytes(c(3e6, 4e6, 5e6), accuracy = .001),
    c("2.861 MiB", "3.815 MiB", "4.768 MiB")
  )
  expect_equal(
    number_bytes(c(3e6, 4e6, 5e6), units = "si", accuracy = .1),
    c("3.0 MB", "4.0 MB", "5.0 MB")
  )

  # unit system is enforced
  expect_warning(number_bytes(1024^(1:2), "kB", units = "binary"), "KiB")
  expect_warning(number_bytes(1024^(1:2), "KiB", units = "si"), "kB")
})

test_that("Byte formatter handles zero values", {
  expect_equal(number_bytes(0), "0 B")
})

test_that("Byte formatter handles large values", {
  expect_equal(number_bytes(1024^11), "1 073 741 824 YiB")
  expect_equal(number_bytes(1000^9, units = "si"), "1 000 YB")
})

test_that("Byte formatter handles negative values", {
  expect_equal(number_bytes(-1024^2), "-1 MiB")
})

test_that('Byte formatter symbol = "auto" can show variable multiples', {
  expect_equal(number_bytes(1024^(1:3)), c("1 KiB", "1 MiB", "1 GiB"))
})

test_that("Byte formatter throws informative error for wrong length symbol", {
  expect_error(number_bytes(symbol = character()), "not length 0")
  expect_error(number_bytes(symbol = c("kB", "MB")), "not length 2")
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
  expect_identical(math_format()(x), list())
  expect_identical(parse_format()(x), expression())
  expect_identical(parse_format()(character()), expression())
  expect_identical(percent_format()(x), expected)
  expect_identical(scientific_format()(x), expected)
  expect_identical(trans_format(identity)(x), expected)
})
