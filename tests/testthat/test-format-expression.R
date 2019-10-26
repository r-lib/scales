test_that("parse_format() returns an expression object", {
  expect_equal(
    parse_format()(c("alpha", "beta", "gamma")),
    expression(alpha, beta, gamma)
  )

  expect_equal(
    parse_format()(1:5),
    expression(1, 2, 3, 4, 5)
  )

  expect_identical(math_format()(character()), expression())
  expect_identical(parse_format()(character()), expression())
})

test_that("math_format() returns expression", {
  expect_equal(math_format()(1), expression(10 ^ 1))
})


