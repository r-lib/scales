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

test_that("Boxcox can handle NA values", {
  trans <- boxcox_trans(p = 0)
  expect_equal(trans$trans(c(1, NA_real_)), c(0, NA_real_))
})

test_that("Boxcox is invertible", {
  trans <- boxcox_trans(p = .1)
  expect_equal(trans$inv(trans$trans(0:10)), 0:10)
  trans <- boxcox_trans(p = -2)
  expect_equal(trans$inv(trans$trans(0:10)), 0:10)
  trans <- boxcox_trans(p = 1)
  expect_equal(trans$inv(trans$trans(0:10)), 0:10)
})

test_that("Yeo-Johnson is invertible", {
  x <- c(-12345, 12345, -0.12345, 0.12345, -10:10)

  trans <- yj_trans(p = -1.5)
  expect_equal(trans$inverse(trans$transform(x)), x)

  trans <- yj_trans(p = 0)
  expect_equal(trans$inverse(trans$transform(x)), x)

  trans <- yj_trans(p = 0.7)
  expect_equal(trans$inverse(trans$transform(x)), x)

  trans <- yj_trans(p = 1.5)
  expect_equal(trans$inverse(trans$transform(x)), x)

  trans <- yj_trans(p = 2)
  expect_equal(trans$inverse(trans$transform(x)), x)
})

test_that("Yeo-Johnson is identity function for p = 1", {
  x <- c(-12345, 12345, -0.12345, 0.12345, -10:10)
  trans <- yj_trans(p = 1)
  expect_equal(trans$transform(x), x)
})

test_that("Yeo-Johnson transforms NAs to NAs without error", {
  x <- c(1, 2, NA, 4)
  trans <- yj_trans(p = 1)
  expect_equal(trans$transform(x), x)
})

test_that("Yeo-Johnson transform works", {
  # example data adpated from recipes package
  # https://github.com/tidymodels/recipes/blob/master/tests/testthat/test_YeoJohnson.R
  n <- 20
  set.seed(1)
  x <- data.frame(
    x1 = exp(rnorm(n, mean = .1)),
    x2 = 1/rnorm(n),
    x3 = rexp(n)
  )

  lambdas <- c(
    x1 = -0.2727204451,
    x2 =  1.139292543,
    x3 = -1.012702061)

  expected_data <- data.frame(
    x1 = c(0.435993557749438, 0.754696454247318, 0.371327932207827,
           1.46113017436327, 0.82204097731098, 0.375761562702297, 0.89751975937422,
           1.02175936118846, 0.940739811377902, 0.54984302797741, 1.41856737837093,
           0.850587387615876, 0.437701618670981, 0.112174615510591, 1.21942112715274,
           0.654589551748501, 0.666780580127795, 1.12625135443351, 1.0636850911955,
           0.949680956411546),
    x2 = c(1.15307873387121, 1.36532999080347,
           17.4648439780388, -0.487746797875704, 1.74452440065935, -13.3640721541574,
           -5.35805967319061, -0.653901985285932, -1.90735599477338, 2.65253432454371,
           0.76771137336975, -7.79484535687973, 2.87484976680907, -13.8738947581599,
           -0.696856395842167, -2.17745353101028, -2.28384276604207, -12.7261652971783,
           0.95585544349634, 1.40099012093008),
    x3 = c(0.49061104973894, 0.49670370366879, 0.338742419511653,
           0.663722100577351, 0.296260662322359, 0.681346128666408,
           0.757581280603711, 0.357148961119583, 0.371872889850153,
           0.49239057672598, 0.173259524331095, 0.235933290139909, 0.52297977893566,
           0.434927187456966, 0.0822501770191215, 0.523479652016858,
           0.197977570919824, 0.608108816144845, 0.821913792446345,
           0.300608495427594))

  expect_equal(yj_trans(lambdas[1])$transform(x[[1]]), expected_data[[1]])
  expect_equal(yj_trans(lambdas[2])$transform(x[[2]]), expected_data[[2]])
  expect_equal(yj_trans(lambdas[3])$transform(x[[3]]), expected_data[[3]])
})
