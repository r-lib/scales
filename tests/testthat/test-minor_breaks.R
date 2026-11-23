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

test_that("minor_breaks_n extends the adjacent intervals to the limits", {
  minor <- minor_breaks_n(3)
  limits <- c(-3, 14)
  major <- c(0, 4, 10)
  expected <- c(-2, 0, 2, 4, 7, 10, 13)

  expect_equal(minor(limits, major), expected)
  expect_equal(minor(rev(limits), rev(major)), rev(expected))
})

test_that("minor_breaks_n clips extrapolated breaks that overflow", {
  major <- c(1e308, 1.5e308)

  expect_equal(minor_breaks_n(3)(major, major), c(1e308, 1.25e308, 1.5e308))
})

test_that("minor_breaks_n clips durations in the units of the major breaks", {
  limits <- as.difftime(c(-180, 840), units = "secs")
  major <- as.difftime(c(0, 4, 10), units = "mins")

  expect_equal(minor_breaks_n(3)(limits, major), c(-2, 0, 2, 4, 7, 10, 13))
})
