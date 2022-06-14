test_that("label_itemized works correctly", {
  x <- 1:5
  x_na <- c(1, 2, NA, 4, 5)

  expect_equal(label_itemized("a")(x), c("a", "b", "c", "d", "e"))
  expect_equal(label_itemized("A")(x), c("A", "B", "C", "D", "E"))
  expect_equal(label_itemized("i")(x), c("i", "ii", "iii", "iv", "v"))
  expect_equal(label_itemized("I")(x), c("I", "II", "III", "IV", "V"))
  expect_equal(label_itemized("1")(x), c("1", "2", "3", "4", "5"))

  expect_equal(label_itemized("a)")(x), c("a)", "b)", "c)", "d)", "e)"))
  expect_equal(label_itemized("A)")(x), c("A)", "B)", "C)", "D)", "E)"))
  expect_equal(label_itemized("i)")(x), c("i)", "ii)", "iii)", "iv)", "v)"))
  expect_equal(label_itemized("I)")(x), c("I)", "II)", "III)", "IV)", "V)"))
  expect_equal(label_itemized("1)")(x), c("1)", "2)", "3)", "4)", "5)"))

  expect_equal(label_itemized("a")(x_na), c("a", "b", NA, "d", "e"))
})

test_that("label_itemized preserves names", {
  expect_named(label_itemized("a")(c(a = 1)), "a")
})
