test_that("rescales values independently", {
  number_si <- label_number_si()
  expect_equal(
    number_si(10^c(-24, -21, -18, -15, -12, -9, -6, -3, 0, 3, 6, 9, 12, 15, 18, 21, 24)),
    c("1y", "1z", "1a", "1f", "1p", "1n", "1μ", "1m", "1", "1k", "1M", "1G", "1T", "1P", "1E", "1Z", "1Y")
  )
  expect_equal(number_si(c(-1e3, 1e6, 1e9)), c("-1k", "1M", "1G"))
})

test_that("handles units correctly", {
  number_si <- label_number_si(unit = "g")
  expect_equal(number_si(c(1e-6, 1e-3, 1, 1e3, 1e6)), c("1 μg", "1 mg", "1 g", "1 kg", "1 Mg"))
})

test_that("handles out-of-range inputs correctly", {
  number_si <- label_number_si(accuracy = 0.1)
  expect_equal(number_si(c(1e-27, 1e-25, 1e25, 1e27)), c("0.0y", "0.1y", "10.0Y", "1 000.0Y"))
})

test_that("handles bad inputs gracefully", {
  number_si <- label_number_si()
  expect_equal(number_si(c(1, NA)), c("1", NA))
  expect_equal(number_si(c(1, Inf)), c("1", "Inf"))
})

test_that("arguments passed on to number()", {
  number_si <- label_number_si(accuracy = .1, big.mark = ",")
  expect_equal(number_si(1e27), "1,000.0Y")
})

test_that("number_si preserves names", {
  number_si <- label_number_si()
  expect_named(number_si(c(a = 1)), "a")
})
