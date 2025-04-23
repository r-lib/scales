test_that("label_glue environments work out as intended", {
  x <- LETTERS[1:3]
  y <- "foo"

  # Note `{x}` should mask the `x <- LETTERS[1:3]` above
  f <- label_glue("{x} and {y}")
  expect_equal(f(letters[1:3]), c("a and foo", "b and foo", "c and foo"))
})
