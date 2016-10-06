context("breaks - extended")

test_that("extended breaks returns no breaks for bad inputs", {
  breaks <- extended_breaks()

  expect_equal(breaks(NA), numeric())
  expect_equal(breaks(Inf), numeric())
  expect_equal(breaks(NaN), numeric())
})
