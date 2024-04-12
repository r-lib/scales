test_that("recycle_common throws appropriate errors", {

  expect_error(
    recycle_common(a = 1:2, size = 3),
    "length 3"
  )
  expect_error(
    recycle_common(a = 1:2, b = 1:3),
    "common size"
  )

  expect_error(
    recycle_common(a = 1:2, b = 1:3, size = 3),
    "Cannot recycle `a`"
  )

})
