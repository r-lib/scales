test_that("compose_labels can chain together functions", {
  labeller <- compose_label(`-`, label_number(suffix = " foo"), toupper)
  expect_equal(
    labeller(c(0.1, 1.0, 10.0)),
    c("-0.1 FOO", "-1.0 FOO", "-10.0 FOO"),
    ignore_attr = TRUE
  )
})
