test_that("Transformed ranges silently drop out-of-domain values", {
  r1 <- trim_to_domain(transform_log(), -1:10)
  expect_equal(r1, log(c(1e-100, 10)))

  r2 <- trim_to_domain(transform_sqrt(), -1:10)
  expect_equal(r2, sqrt(c(0, 10)))
})


test_that("as.transform handles character inputs", {
  expect_equal(as.trans("log10"), transform_log10())
  expect_equal(
    as.transform(c("log10", "reverse")),
    transform_compose(transform_log10(), transform_reverse())
  )
})

test_that("as.transform generates informative error", {
  expect_snapshot(error = TRUE, {
    as.transform(1)
    as.transform("x")
  })
})

test_that("trans has useful print method", {
  expect_snapshot({
    new_transform("test", transform = identity, inverse = identity)
  })
})

test_that("inverse of trans_sqrt() returns NA for values outside of range", {
  expect_equal(transform_sqrt()$inverse(-2), NA_real_)
})
