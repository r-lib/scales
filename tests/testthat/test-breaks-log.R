test_that("Five ticks over 10^4 range work", {
  expect_equal(breaks_log()(10^(1:5)), 10^(1:5))
})

test_that("behaves nicely when inputs are wacky", {
  expect_equal(breaks_log()(c(0, NA)), 0)

  expect_equal(breaks_log()(c(0, Inf)), numeric())
  expect_equal(breaks_log()(c(NA, NA)), numeric())
  expect_equal(breaks_log()(c(-Inf, Inf)), numeric())
  expect_equal(breaks_log()(numeric(0)), numeric())
})

test_that("use integer base powers when at least 3 breaks are within range", {
  base <- 10
  expect_equal(
    breaks_log(base = base)(base^c(0, 2)),
    base^(0:2)
  )
  base <- 4
  expect_equal(
    breaks_log(base = base)(base^c(0, 2)),
    base^(0:2)
  )
  base <- 2
  expect_equal(
    breaks_log(base = base)(base^c(0, 2)),
    base^(0:2)
  )
})

test_that("add intermediate breaks when more breaks are needed", {
  base <- 10
  expect_equal(
    breaks_log(base = base)(base^c(2, 4) + c(1, -1)),
    c(100, 300, 1000, 3000, 10000)
  )
  expect_equal(
    breaks_log(base = base)(base^c(2, 3) + c(1, -1)),
    c(100, 200, 300, 500, 1000)
  )
  base <- 4
  expect_equal(
    breaks_log(base = base)(base^c(2, 4) + c(1, -1)),
    c(16, 32, 64, 128, 256)
  )
  base <- 3
  expect_equal(
    breaks_log(base = base)(base^c(2, 4) + c(1, -1)),
    c(9, 18, 27, 54, 81)
  )
  base <- 2
  expect_equal(
    breaks_log(n = 5, base = 2)(c(3, 100)),
    c(2, 4, 8, 16, 32, 64, 128)
  )
})

test_that("breaks_log arguments are forcely evaluated on each call #81", {
  subfun1 <- breaks_log(n = 5, base = 10)
  subfun2 <- breaks_log(n = 20, base = 5)

  subfuns <- list()
  cases_n <- c(5, 20)
  cases_base <- c(10, 5)
  for (i in 1:2) {
    subfuns[[i]] <- breaks_log(n = cases_n[i], base = cases_base[i])
  }
  expect_equal(subfun1(1:1000), subfuns[[1]](1:1000))
  expect_equal(subfun2(1:1000), subfuns[[2]](1:1000))
})

test_that("breaks_log with very small ranges fall back to extended_breaks", {
  expect_equal(
    breaks_log(n = 5, base = 10)(c(2.001, 2.002)),
    extended_breaks(n = 5)(c(2.001, 2.002))
  )
  expect_equal(
    breaks_log(n = 5, base = 10)(c(0.95, 1.1)),
    extended_breaks(n = 5)(c(0.95, 1.1))
  )

  # The switch to extended_breaks occurs at approximately the half-log point
  expect_equal(
    breaks_log(n = 5, base = 10)(c(0.95, 2.9)),
    extended_breaks(n = 5)(c(0.95, 2.9))
  )
  expect_false(identical(
    breaks_log(n = 5, base = 10)(c(0.95, 3)),
    extended_breaks(n = 5)(c(0.95, 3))
  ))
})

test_that("minor_breaks_log has correct amount of detail", {
  range <- c(1, 10)

  test <- minor_breaks_log(detail = 1)(range)
  expect_true(all(1:10 %in% test))

  test <- minor_breaks_log(detail = 5)(range)
  expect_false(all(1:10 %in% test))
  expect_true(all(c(1, 5, 10) %in% test))

  test <- minor_breaks_log(detail = 10)(range)
  expect_true(all(c(1, 10) %in% test))
  expect_false(5 %in% test)

  test <- minor_breaks_log(detail = 1)(c(-10, 10))
  expect_true(all(-10:10 %in% test))
})

test_that("minor_breaks_log rejects invalid arguments", {
  expect_snapshot(minor_breaks_log(7), error = TRUE)
  expect_snapshot(minor_breaks_log(smallest = 0), error = TRUE)
})
