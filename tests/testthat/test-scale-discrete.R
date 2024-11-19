test_that("NA.value works for discrete", {
  x <- c(NA, "a", "b", "c", NA)
  pal <- brewer_pal()

  expect_equal(dscale(x, pal)[1], NA_character_)
  expect_equal(dscale(x, pal)[5], NA_character_)
  expect_equal(dscale(x, pal, "grey50")[1], "grey50")
  expect_equal(dscale(x, pal, "grey50")[5], "grey50")
})

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

test_that("discrete ranges can be trained on S3 classes", {
  my_obj <- structure(list("A", c("B", "C")), class = "foo")
  levels.foo <- function(x) unique(unlist(x))
  registerS3method("levels", "foo", method = levels.foo)
  expect_equal(
    train_discrete(my_obj),
    LETTERS[1:3]
  )
})
