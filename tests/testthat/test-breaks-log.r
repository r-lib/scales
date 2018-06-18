context("Breaks - log")

test_that("Five ticks over 10^4 range work", {
  expect_equal(log_breaks()(10^(1:5)), 10^(1:5))
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

