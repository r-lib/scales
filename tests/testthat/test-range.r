context("Ranges")

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
})
