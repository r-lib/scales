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
