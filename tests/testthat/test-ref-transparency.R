context("Referencial transparency")

test_that("hue_pal preserves referencial transparency", {
  col1 <- hue_pal(h.start = 0)
  col2 <- hue_pal(h.start = 90)

  colours <- list()
  hues <- c(0, 90)
  for (i in 1:2) {
    colours[[i]] <- hue_pal(h.start = hues[i])
  }
  expect_equal(col1(1), colours[[1]](1))
  expect_equal(col2(1), colours[[2]](1))
})

test_that("pretty_breaks preserves referencial transparency", {
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

test_that("log_breaks preserves referencial transparency", {
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

