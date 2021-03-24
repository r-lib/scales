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

test_that("rescale_large works", {
  x <- 10^(seq(0, 18, 3))

  expect_equal(
    label_dollar(rescale_large = rescale_short_scale())(x),
    c("$1", "$1K", "$1M", "$1B", "$1T", "$1,000T", "$1,000,000T")
  )
  expect_equal(
    label_dollar(rescale_large = rescale_long_scale())(x),
    c("$1", "$1K", "$1M", "$1,000M", "$1B", "$1,000B", "$1T")
  )
  expect_equal(
    label_dollar(rescale_large = c(k = 3L, m = 6L, bn = 9L, tn = 12L))(x),
    c("$1", "$1k", "$1m", "$1bn", "$1tn", "$1,000tn", "$1,000,000tn")
  )

  x <- c(1, 2, 10, 100)

  expect_equal(
    label_dollar(scale = 2, rescale_large = rescale_short_scale())(x * 1e3),
    c("$2.0K", "$4.0K", "$20.0K", "$200.0K")
  )
  expect_equal(
    label_dollar(scale = 2, rescale_large = rescale_short_scale())(x * 1e4),
    c("$20K", "$40K", "$200K", "$2M")
  )
})
