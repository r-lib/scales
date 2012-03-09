context("Breaks - log")

test_that("Five ticks over 10^4 range work", {
  expect_equal(log_breaks()(10^(1:5)), 10 ^ (1:5))

})