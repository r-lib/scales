test_that("label_log() returns expression", {
  expect_identical(label_log()(numeric()), expression())
  expect_identical(label_log()(NA_real_), expression(NA))

  expect_equal(label_log()(c(0.1, 10)), expression(10^-1, 10^1))
  expect_equal(label_log(base = 2)(8), expression(2^3))
  expect_equal(label_log(base = 2, digits = 3)(7), expression(2^2.81))
  expect_equal(label_log(signed = TRUE)(c(-100, 100)), expression(-10^2, +10^2))
})
