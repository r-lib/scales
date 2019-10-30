test_that("parse_format() returns an expression object", {
  expect_equal(
    parse_format()(c("alpha", "beta", "gamma")),
    expression(alpha, beta, gamma)
  )

  expect_equal(
    parse_format()(1:5),
    expression(1, 2, 3, 4, 5)
  )

  expect_identical(label_math()(character()), expression())
  expect_identical(label_parse()(character()), expression())
})

test_that("math_format() returns expression", {
  expect_equal(label_math()(1), expression(10 ^ 1))
})


