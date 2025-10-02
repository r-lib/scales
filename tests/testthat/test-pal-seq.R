test_that("pal_seq() gives correct values", {
  p <- pal_seq(5, 10)
  expect_equal(p(6), 5:10)
  p <- pal_seq(0, -10)
  expect_equal(p(3), c(0, -5, -10))
})
