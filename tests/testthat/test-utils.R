test_that("recycle_common throws appropriate errors", {
  expect_snapshot(recycle_common(a = 1:2, size = 3), error = TRUE)
  expect_snapshot(recycle_common(a = 1:2, b = 1:3), error = TRUE)
  expect_snapshot(recycle_common(a = 1:2, b = 1:3, size = 3), error = TRUE)
})
