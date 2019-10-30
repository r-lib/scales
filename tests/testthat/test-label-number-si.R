test_that("rescales values independently", {
  number_si <- label_number_si()
  expect_equal(number_si(c(1e3, 1e6, 1e9)), c("1K", "1M", "1B"))
  expect_equal(number_si(c(-1e3, 1e6, 1e9)), c("-1K", "1M", "1B"))
  expect_equal(number_si(c(.50, 1e6, 1e15)), c("0", "1M", "1 000T"))
})

test_that("handles bad inputs gracefully", {
  number_si <- label_number_si()
  expect_equal(number_si(c(1, NA)), c("1", NA))
  expect_equal(number_si(c(1, Inf)), c("1", "Inf"))
})

test_that("arguments passed on to number()", {
  number_si <- label_number_si(accuracy = .1, prefix = "$")
  expect_equal(number_si(c(.50, 1e6, 1e9)), c("$0.5", "$1.0M", "$1.0B"))
})

test_that("number_si preserves names", {
  number_si <- label_number_si()
  expect_named(number_si(c(a = 1)), "a")
})
