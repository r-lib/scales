test_that("label_number_si() is deprecated", {
  lifecycle::expect_defunct(label_number_si(""))

  lifecycle::expect_defunct(label_number_si("m"))
})
