test_that("Transformed ranges silently drop out-of-domain values", {
  r1 <- trans_range(log_trans(), -1:10)
  expect_equal(r1, log(c(1e-100, 10)))

  r2 <- trans_range(sqrt_trans(), -1:10)
  expect_equal(r2, sqrt(c(0, 10)))
})


test_that("as.trans handles character inputs", {
  expect_equal(as.trans("log10"), log10_trans())
  expect_equal(
    as.trans(c("log10", "reverse")),
    compose_trans(log10_trans(), reverse_trans())
  )
})

test_that("as.trans generates informative error", {
  expect_snapshot(error = TRUE, {
    as.trans(1)
    as.trans("x")
  })
})

test_that("trans has useful print method", {
  expect_snapshot({
    trans_new("test", transform = identity, inverse = identity)
  })
})
