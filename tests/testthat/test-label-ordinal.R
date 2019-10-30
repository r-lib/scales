
test_that("ordinal format in English", {
  expect_equal(
    ordinal_format()(1:4),
    c("1st", "2nd", "3rd", "4th")
  )
  expect_equal(ordinal(1), "1st")
  expect_equal(ordinal(2), "2nd")
  expect_equal(ordinal(3), "3rd")
  expect_equal(ordinal(4), "4th")
  expect_equal(ordinal(11), "11th")
  expect_equal(ordinal(12), "12th")
  expect_equal(ordinal(21), "21st")
  expect_equal(ordinal(101), "101st")
  expect_equal(ordinal(NA), NA_character_)
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

