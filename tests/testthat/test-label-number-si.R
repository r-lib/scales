test_that("label_number_si() is deprecated", {
  lifecycle::expect_deprecated(lab <- label_number_si(""))
  expect_equal(lab(c(0, 1e3, 1e6)), c("0", "1K", "1M"))

  lifecycle::expect_deprecated(lab <- label_number_si("m"))
  expect_equal(lab(c(0, 1e3, 1e6)), c("0 m", "1 Km", "1 Mm"))
})
