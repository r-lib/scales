test_that("pal_manual gives warning if n greater than the number of values", {
  expect_snapshot(pal_manual(c("red", "blue", "green"))(4))
})

test_that("pal_manual returns an unnamed vector", {
  x <- c(foo = "red", bar = "blue")
  expect_equal(pal_manual(x)(2), unname(x))
})
