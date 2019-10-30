test_that("wrap correctly wraps long lines", {
  expect_equal(
    label_wrap(10)("this is a long line"),
    "this is a\nlong line"
  )
  expect_equal(
    label_wrap(10)(c("this is a long line", "this is another long line")),
    c("this is a\nlong line", "this is\nanother\nlong line")
  )
  expect_equal(
    label_wrap(10)("a_very_long_word_without_spaces"),
    "a_very_long_word_without_spaces"
  )
  expect_equal(wrap_format(10)("short line"), "short\nline")
  expect_equal(wrap_format(15)("short line"), "short line")
})
