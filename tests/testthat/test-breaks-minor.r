context("minor breaks")

l1 <- c(0, 9)
l2 <- -l1
b1 <- extended_breaks()(l1)
b2 <- extended_breaks()(l2)
m1 <- regular_minor_breaks()(b1, l1, n = 2)
m2 <- regular_minor_breaks()(b2, l2, n = 2)

test_that("minor breaks are calculated correctly", {
  expect_equal(m1, seq(b1[1], b1[length(b1)], by = 1.25))
  expect_equal(m2, seq(b2[1], b2[length(b2)], by = 1.25))
})

test_that("minor breaks for reversed scales are comparable to non-reversed", {
  expect_equal(m1, sort(-m2))
})
