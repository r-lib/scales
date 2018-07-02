context("Trans - numeric")

test_that("Pseudo-log is invertible", {
  trans <- pseudo_log_trans()
  expect_equal(
    trans$inverse(trans$transform(-10:10)),
    -10:10
  )
})

test_that("Modulus is invertible for negative and positive numbers", {
  trans <- modulus_trans(p = .1)
  expect_equal(trans$inv(trans$trans(-10:10)), -10:10)
  trans <- modulus_trans(p = -2)
  expect_equal(trans$inv(trans$trans(-10:10)), -10:10)
  trans <- modulus_trans(p = 1)
  expect_equal(trans$inv(trans$trans(-10:10)), -10:10)
})

test_that("Boxcox gives error for negative values", {
  trans <- boxcox_trans(p = .1)
  expect_error(trans$trans(-10:10))
  trans <- boxcox_trans(p = -2)
  expect_error(trans$trans(-10:10))
})

test_that("Boxcox is invertible", {
  trans <- boxcox_trans(p = .1)
  expect_equal(trans$inv(trans$trans(0:10)), 0:10)
  trans <- boxcox_trans(p = -2)
  expect_equal(trans$inv(trans$trans(0:10)), 0:10)
  trans <- boxcox_trans(p = 1)
  expect_equal(trans$inv(trans$trans(0:10)), 0:10)
})
