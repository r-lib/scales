context("manual_pal")

test_that("manual_pal gives warning if n greater than the number of values", {
  expect_warning(manual_pal(c("red", "blue", "green"))(4), "can handle a maximum")
})
