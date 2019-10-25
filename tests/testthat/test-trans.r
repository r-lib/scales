context("Trans")

test_that("Transformed ranges silently drop out-of-domain values", {
  r1 <- trans_range(log_trans(), -1:10)
  expect_that(r1, equals(log(c(1e-100, 10))))

  r2 <- trans_range(sqrt_trans(), -1:10)
  expect_that(r2, equals(sqrt(c(0, 10))))
})

test_that("inverse of trans_sqrt() returns NA for values outside of range", {
  expect_equal(sqrt_trans()$inverse(-2), NA_real_)
})
