context("Trans - numeric")

test_that("Pseudo-log is invertible", {
  trans <- pseudo_log_trans()
  expect_equal(
    trans$inverse(trans$transform(-10:10)),
    -10:10
  )
})

test_that("Box-Cox is invertible", {
  trans <- boxcox_trans(p = .1)
  expect_equal(trans$inv(trans$trans(-10:10)), -10:10)
  trans <- boxcox_trans(p = -2)
  expect_equal(trans$inv(trans$trans(-10:10)), -10:10)
  trans <- boxcox_trans(p = 1)
  expect_equal(trans$inv(trans$trans(-10:10)), -10:10)
})
