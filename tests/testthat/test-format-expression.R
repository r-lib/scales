test_that("parse format returns an expression object", {
  expect_equal(
    parse_format()(c("alpha", "beta", "gamma")),
    expression(alpha, beta, gamma)
  )

  expect_equal(
    parse_format()(1:5),
    expression(1, 2, 3, 4, 5)
  )
})
