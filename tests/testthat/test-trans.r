test_that("Transformed ranges silently drop out-of-domain values", {
  r1 <- trans_range(log_trans(), -1:10)
  expect_equal(r1, log(c(1e-100, 10)))

  r2 <- trans_range(sqrt_trans(), -1:10)
  expect_equal(r2, sqrt(c(0, 10)))
})
