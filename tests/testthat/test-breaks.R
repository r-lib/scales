test_that("extended breaks returns no breaks for bad inputs", {
  breaks <- extended_breaks()

  expect_equal(breaks(NA), numeric())
  expect_equal(breaks(Inf), numeric())
  expect_equal(breaks(NaN), numeric())
})

test_that("breaks_pretty() arguments are forcely evaluated on each call #81", {
  subfun1 <- breaks_pretty(n = 5)
  subfun2 <- breaks_pretty(n = 10)

  subfuns <- list()
  cases <- c(5, 10)
  for (i in 1:2) {
    subfuns[[i]] <- breaks_pretty(n = cases[i])
  }
  expect_equal(subfun1(1), subfuns[[1]](1))
  expect_equal(subfun2(1), subfuns[[2]](1))

  # A ... argument:
  subfun1 <- breaks_pretty(n = 10, min.n = 2)
  subfun2 <- breaks_pretty(n = 10, min.n = 5)

  subfuns <- list()
  cases <- c(2, 5)
  for (i in 1:2) {
    subfuns[[i]] <- breaks_pretty(n = 10, min.n = cases[i])
  }
  expect_equal(subfun1(1), subfuns[[1]](1))
  expect_equal(subfun2(1), subfuns[[2]](1))
})

test_that("breaks_pretty() returns input when given zero-width range (#446)", {
  expect_equal(breaks_pretty()(c(1, 1)), 1)
})

test_that("exponential breaks give sensible values", {
  x <- breaks_exp()(c(0, 2))
  expect_equal(x, c(0, 0.5, 1, 1.5, 2))

  x <- breaks_exp()(c(0, 5))
  expect_equal(x, c(5, 4, 3, 2, 0))

  x <- breaks_exp()(c(100, 102))
  expect_equal(x, c(0, 0.5, 1, 1.5, 2) + 100)

  x <- breaks_exp()(c(0, 100))
  expect_equal(x, c(100, 99, 98, 97, 0))
})
