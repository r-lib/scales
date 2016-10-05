context("discrete")

test_that("na.rm = FALSE keeps NA", {
  x1 <- c("a", NA)
  x2 <- factor(x1)
  x3 <- addNA(x2)

  expect_equal(train_discrete(x1, na.rm = FALSE), c("a", NA))
  expect_equal(train_discrete(x2, na.rm = FALSE), c("a", NA))
  expect_equal(train_discrete(x3, na.rm = FALSE), c("a", NA))
})


test_that("na.rm = TRUE drops NA", {
  x1 <- c("a", NA)
  x2 <- factor(x1)
  x3 <- addNA(x2)

  expect_equal(train_discrete(x1, na.rm = TRUE), "a")
  expect_equal(train_discrete(x2, na.rm = TRUE), "a")
  expect_equal(train_discrete(x3, na.rm = TRUE), "a")
})
