test_that("R6 inheritance works", {
  expect_no_error(ContinuousRange$new())
  expect_no_error(DiscreteRange$new())
  expect_true(R6::is.R6(ContinuousRange$new()))
  expect_true(R6::is.R6(DiscreteRange$new()))
})

test_that("Mutable ranges work", {
  x <- ContinuousRange$new()
  x$train(c(-1, 45, 10))
  expect_equal(x$range, c(-1, 45))
  x$train(c(1000))
  expect_equal(x$range, c(-1, 1000))
  x$reset()
  expect_equal(x$range, NULL)

  x <- DiscreteRange$new()
  x$train(factor(letters[1:3]))
  expect_equal(x$range, c("a", "b", "c"))
  x$train(factor(c("a", "h")))
  expect_equal(x$range, c("a", "b", "c", "h"))
  x$reset()
  expect_equal(x$range, NULL)
})

test_that("starting with NULL always returns new", {
  expect_equal(discrete_range(NULL, 1:3), 1:3)
  expect_equal(discrete_range(NULL, 3:1), 1:3)
  expect_equal(discrete_range(NULL, c("a", "b", "c")), c("a", "b", "c"))
  expect_equal(discrete_range(NULL, c("c", "b", "a")), c("a", "b", "c"))

  f1 <- factor(letters[1:3], levels = letters[1:4])
  expect_equal(discrete_range(NULL, f1, drop = FALSE), letters[1:4])
  expect_equal(discrete_range(NULL, f1, drop = TRUE), letters[1:3])

  f2 <- factor(letters[1:3], levels = letters[4:1])
  expect_equal(discrete_range(NULL, f2, drop = FALSE), letters[4:1])
  expect_equal(discrete_range(NULL, f2, drop = TRUE), letters[3:1])
})

test_that("factor discrete ranges stay in order", {
  f <- factor(letters[1:3], levels = letters[3:1])

  expect_equal(discrete_range(f, f), letters[3:1])
  expect_equal(discrete_range(f, "c"), letters[3:1])
  expect_equal(discrete_range(f, c("a", "b", "c")), letters[3:1])
  expect_equal(
    discrete_range(f, c("a", "b", "c", NA), na.rm = FALSE),
    c(letters[3:1], NA)
  )
})

test_that("factor discrete ranges take precedence over character", {
  f <- factor(letters[1:3], levels = letters[3:1])

  expect_equal(discrete_range(letters[1:3], f), letters[3:1])
  expect_equal(discrete_range(letters[1:4], f), letters[c(3:1, 4)])
})
