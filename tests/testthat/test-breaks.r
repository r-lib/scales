context("Breaks")

test_that("pretty_breaks arguments are forcely evaluated on each call #81", {
  subfun1 <- pretty_breaks(n = 5)
  subfun2 <- pretty_breaks(n = 10)

  subfuns <- list()
  cases <- c(5, 10)
  for (i in 1:2) {
    subfuns[[i]] <- pretty_breaks(n = cases[i])
  }
  expect_equal(subfun1(1), subfuns[[1]](1))
  expect_equal(subfun2(1), subfuns[[2]](1))

  # A ... argument:
  subfun1 <- pretty_breaks(n = 10,  min.n = 2)
  subfun2 <- pretty_breaks(n = 10,  min.n = 5)

  subfuns <- list()
  cases <- c(2, 5)
  for (i in 1:2) {
    subfuns[[i]] <- pretty_breaks(n = 10, min.n = cases[i])
  }
  expect_equal(subfun1(1), subfuns[[1]](1))
  expect_equal(subfun2(1), subfuns[[2]](1))
})

