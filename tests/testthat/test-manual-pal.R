test_that("manual_pal gives warning if n greater than the number of values", {
  expect_warning(manual_pal(c("red", "blue", "green"))(4), "can handle a maximum")
})

test_that("manual_pal returns an unnamed vector", {
  x <- c(foo = "red", bar = "blue")
  expect_equal(manual_pal(x)(2), unname(x))
})
