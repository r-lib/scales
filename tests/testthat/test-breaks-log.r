context("Breaks - log")

test_that("Five ticks over 10^4 range work", {
  expect_equal(log_breaks()(10^(1:5)), 10^(1:5))
})

test_that("use integer base powers when at least 3 breaks are within range", {
  base <- 10
  expect_equal(
    log_breaks(base = base)(base^c(0, 2)),
    base^(0:2)
  )
  base <- 4
  expect_equal(
    log_breaks(base = base)(base^c(0, 2)),
    base^(0:2)
  )
  base <- 2
  expect_equal(
    log_breaks(base = base)(base^c(0, 2)),
    base^(0:2)
  )
})

test_that("add intermediate breaks when more breaks are needed", {
  base <- 10
  expect_equal(
    log_breaks(base = base)(base^c(2, 4) + c(1, -1)),
    c(100, 300, 1000, 3000, 10000)
  )
  expect_equal(
    log_breaks(base = base)(base^c(2, 3) + c(1, -1)),
    c(100, 200, 300, 500, 1000)
  )
  base <- 4
  expect_equal(
    log_breaks(base = base)(base^c(2, 4) + c(1, -1)),
    c(16, 32, 64, 128, 256)
  )
  base <- 3
  expect_equal(
    log_breaks(base = base)(base^c(2, 4) + c(1, -1)),
    c(9, 18, 27, 54, 81)
  )
  base <- 2
  expect_equal(
    log_breaks(n = 5, base = 2)(c(3, 100)),
    c(2, 4, 8, 16, 32, 64, 128)
  )
})

test_that("log_breaks arguments are forcely evaluated on each call #81", {
  subfun1 <- log_breaks(n = 5, base = 10)
  subfun2 <- log_breaks(n = 20, base = 5)

  subfuns <- list()
  cases_n <- c(5, 20)
  cases_base <- c(10, 5)
  for (i in 1:2) {
    subfuns[[i]] <- log_breaks(n = cases_n[i], base = cases_base[i])
  }
  expect_equal(subfun1(1:1000), subfuns[[1]](1:1000))
  expect_equal(subfun2(1:1000), subfuns[[2]](1:1000))
})
