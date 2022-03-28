test_that("negative comes before prefix", {
  expect_equal(label_dollar()(-1), "-$1")
})

test_that("negative_parens is deprecated", {
  lifecycle::expect_deprecated({
    out <- label_dollar(negative_parens = TRUE)(-1)
  })
  expect_equal(out, "($1)")
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
    label_dollar(scale_cut = cut_short_scale())(x),
    c("$1", "$1K", "$1M", "$1B", "$1T", "$1,000T", "$1,000,000T")
  )
  expect_equal(
    label_dollar(scale_cut = cut_long_scale())(x),
    c("$1", "$1K", "$1M", "$1,000M", "$1B", "$1,000B", "$1T")
  )
  expect_equal(
    label_dollar(scale_cut = c(0, k = 1e3, m = 1e6, bn = 1e9, tn = 1e12))(x),
    c("$1", "$1k", "$1m", "$1bn", "$1tn", "$1,000tn", "$1,000,000tn")
  )
})

test_that("rescale_large compatible with scale argument", {
  x <- c(1, 2, 10, 100)

  expect_equal(
    label_dollar(scale = 2, scale_cut = cut_short_scale())(x * 1e3),
    c("$2K", "$4K", "$20K", "$200K")
  )
  expect_equal(
    label_dollar(scale = 2, scale_cut = cut_short_scale())(x * 1e4),
    c("$20K", "$40K", "$200K", "$2M")
  )
})
