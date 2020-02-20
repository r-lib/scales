test_that("negative comes before prefix", {
  expect_equal(label_dollar()(-1), "-$1")
})

test_that("prefix is inside parentheses", {
  expect_equal(label_dollar(negative_parens = TRUE)(-1), "($1)")
})

test_that("preserves NAs", {
  expect_equal(label_dollar()(NA_real_), NA_character_)
})

test_that("preserves names", {
  expect_named(label_dollar()(c(a = 1)), "a")
})

test_that("decimal.mark could be modified", {
  expect_equal(label_dollar(decimal.mark = ",")(123.45), "$123,45")
})

test_that("billion_scale works", {
  x <- 10^(seq(0, 18, 3))

  expect_equal(
    label_dollar(billion_scale = billion_short())(x),
    c("$1", "$1K", "$1M", "$1B", "$1T", "$1,000T", "$1,000,000T")
  )
  expect_equal(
    label_dollar(billion_scale = billion_long())(x),
    c("$1", "$1K", "$1M", "$1,000M", "$1B", "$1,000B", "$1T")
  )
  expect_equal(
    label_dollar(billion_scale = c(k = 3, mn = 6, bn = 9, tn = 12))(x),
    c("$1", "$1k", "$1mn", "$1bn", "$1tn", "$1,000tn", "$1,000,000tn")
  )
})
