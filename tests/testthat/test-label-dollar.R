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

test_that("can rescale with scale_cut", {
  lab <- label_dollar(scale_cut = cut_short_scale())
  expect_equal(lab(c(1, 1e3, 1e6)), c("$1", "$1K", "$1M"))

  lab <- label_dollar(scale_cut = cut_short_scale(), prefix = "", suffix = " USD")
  expect_equal(lab(c(1, 1e3, 1e6)), c("1 USD", "1K USD", "1M USD"))
})
