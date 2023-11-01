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
