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

test_that("dollar format", {
  expect_equal(dollar(c(100, 0.23, 1.456565, 2e3)),
               c("$100.00", "$0.23", "$1.46", "$2,000.00"))
  expect_equal(dollar(c(1:10 * 10)),
               c("$10", "$20", "$30", "$40", "$50", "$60", "$70",
                 "$80", "$90", "$100"))
  expect_equal(dollar((1:10 * 10) + 0.01),
               c("$10.01", "$20.01", "$30.01", "$40.01", "$50.01", "$60.01",
                 "$70.01", "$80.01", "$90.01", "$100.01"))
  expect_equal(dollar((1:10 * 10) + 0.001),
               c("$10", "$20", "$30", "$40", "$50", "$60", "$70",
                 "$80", "$90", "$100"))
  expect_equal(dollar(10^(1:8)),
               c("$10", "$100", "$1,000", "$10,000", "$100,000",
                 "$1,000,000", "$10,000,000", "$100,000,000"))
  expect_equal(dollar(seq(10111.11, 100000, 10111.11)),
               c("$10,111.11", "$20,222.22", "$30,333.33", "$40,444.44",
                 "$50,555.55", "$60,666.66", "$70,777.77", "$80,888.88",
                 "$90,999.99"))
  expect_equal(dollar(seq(101111.11, 1000000, 101111.11)),
               c("$101,111", "$202,222", "$303,333", "$404,444", "$505,556",
                 "$606,667", "$707,778", "$808,889", "$910,000"))
  expect_equal(dollar(seq(101111, 1000000, 101111)),
               c("$101,111", "$202,222", "$303,333", "$404,444", "$505,555",
                 "$606,666", "$707,777", "$808,888", "$909,999"))
  expect_equal(dollar(seq(10111111.11, 100000000, 10111111.11)),
               c("$10,111,111", "$20,222,222", "$30,333,333", "$40,444,444",
                 "$50,555,556", "$60,666,667", "$70,777,778", "$80,888,889",
                 "$91,000,000"))
  expect_equal(dollar((1:10) * 100000),
               c("$100,000", "$200,000", "$300,000", "$400,000", "$500,000",
                 "$600,000", "$700,000", "$800,000", "$900,000", "$1,000,000"))
  expect_equal(dollar(((1:10) * 100000) + 0.01),
               c("$100,000", "$200,000", "$300,000", "$400,000", "$500,000",
                 "$600,000", "$700,000", "$800,000", "$900,000", "$1,000,000"))
  expect_equal(dollar(c(9.999)), c("$10"))
  expect_equal(dollar(c(99.999)), c("$100"))
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
