
test_that("ordinal format in English", {
  expect_snapshot({
    ordinal(c(1:4, 11:21, 101, NA))

    ordinal(c(1, 2, 10, 11, NA), rules = ordinal_french())
    ordinal(c(1, 2, 10, 11, NA), rules = ordinal_french("f", TRUE))
  })
})

test_that("ordinal match rules in order", {
  custom <- list(
    a = "^1",
    b = ".",
    c = "^3"
  )
  expect_equal(
    ordinal(1:3, rules = custom),
    c("1a", "2b", "3b")
  )
})

test_that("ordinal format maintains order", {
  expect_equal(ordinal(c(21, 1, NA, 11)), c("21st", "1st", NA, "11th"))
})

test_that("ordinal preserves names", {
  expect_named(ordinal(c(a = 1)), "a")
})
