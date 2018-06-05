context("Breaks - log")

test_that("Five ticks over 10^4 range work", {
  expect_equal(log_breaks()(10^(1:5)), 10 ^ (1:5))

})

test_that("use integer base powers when at least 3 breaks are within range", {
  base <- 10
  expect_equal(
    log_breaks(base = base)(base ^ c(0, 2)),
    base^(0:2)
  )
  base <- 4
  expect_equal(
    log_breaks(base = base)(base ^ c(0, 2)),
    base^(0:2)
  )
  base <- 2
  expect_equal(
    log_breaks(base = base)(base ^ c(0, 2)),
    base^(0:2)
  )
})

test_that("add intermediate breaks when more breaks are needed", {
  base <- 10
  expect_equal(
    log_breaks(base = base)(base ^ c(2, 4) + c(1, -1)),
    c(100, 300, 1000, 3000, 10000, 30000)
  )
  expect_equal(
    log_breaks(base = base)(base ^ c(2, 3) + c(1, -1)),
    c(100, 200, 300, 500, 1000, 2000, 3000, 5000)
  )
  base <- 4
  expect_equal(
    log_breaks(base = base)(base ^ c(2, 4) + c(1, -1)),
    c(16, 32, 64, 128, 256, 512)
  )
  base <- 3
  expect_equal(
    log_breaks(base = base)(base ^ c(2, 4) + c(1, -1)),
    c(9, 18, 27, 54, 81, 162)
  )
})
