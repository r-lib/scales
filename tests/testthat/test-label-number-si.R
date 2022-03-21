test_that("rescales values independently", {
  number_si <- label_number_si("")
  expect_equal(
    number_si(10^c(-24, -21, -18, -15, -12, -9, -6, -3, 0, 3, 6, 9, 12, 15, 18, 21, 24)),
    c("1y", "1z", "1a", "1f", "1p", "1n", "1\u00b5", "1m", "1", "1k", "1M", "1G", "1T", "1P", "1E", "1Z", "1Y")
  )
  expect_equal(number_si(c(-1e3, 1e6, 1e9)), c("-1k", "1M", "1G"))
})

test_that("processes accuracy by suffix group", {
  x <- c(0, 250, 500, 750, 1250, 1500) * 1e3
  expect_equal(
    label_number_si("")(x),
    c("0", "250k", "500k", "750k", "1.25M", "1.50M")
  )
})

test_that("requires unit argument", {
  expect_error(label_number_si())
  expect_silent(label_number_si("m"))
})

test_that("handles units correctly", {
  number_si <- label_number_si(unit = "g")
  expect_equal(number_si(c(1e-6, 1e-3, 1, 1e3, 1e6)), c("1 \u00b5g", "1 mg", "1 g", "1 kg", "1 Mg"))
})

test_that("handles out-of-range inputs correctly", {
  number_si <- label_number_si("", accuracy = 0.1)
  expect_equal(number_si(c(0, 1e-27, 1e-25, 1e25, 1e27)), c("0.0", "0.0y", "0.1y", "10.0Y", "1 000.0Y"))
})

test_that("handles bad inputs gracefully", {
  number_si <- label_number_si("m")
  expect_equal(number_si(c(1, NA)), c("1 m", NA))
  expect_equal(number_si(c(1, Inf)), c("1 m", "Inf"))
})

test_that("arguments passed on to number()", {
  number_si <- label_number_si("", accuracy = .1, big.mark = ",")
  expect_equal(number_si(1e27), "1,000.0Y")
})

test_that("compatible with scale argument", {
  number_si <- label_number_si("m", scale = 2)
  expect_equal(number_si(500), "1 km")
})

test_that("number_si preserves names", {
  number_si <- label_number_si("m")
  expect_named(number_si(c(a = 1)), "a")
})
