test_that("minor breaks are calculated correctly", {
  l1 <- c(0, 9)
  b1 <- extended_breaks()(l1)
  m1 <- regular_minor_breaks()(b1, l1, n = 2)

  expect_equal(m1, c(0, 1.25, 2.5, 3.75, 5, 6.25, 7.5, 8.75, 10))
})

test_that("minor breaks for reversed scales are comparable to non-reversed", {
  l2 <- c(0, -9)
  b2 <- extended_breaks()(l2)
  m2 <- regular_minor_breaks()(b2, l2, n = 2)
  expect_equal(m2, c(-10, -8.75, -7.5, -6.25, -5, -3.75, -2.5, -1.25, 0))
})
