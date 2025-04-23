test_that("label_dictionary gives correct answers", {
  short <- c("A", "B", "C")
  lut <- c("A" = "Apple", "C" = "Cherry", "D" = "Date")

  expect_equal(label_dictionary(lut)(short), c("Apple", "B", "Cherry"))
  expect_equal(
    label_dictionary(lut, nomatch = "Banana")(short),
    c("Apple", "Banana", "Cherry")
  )
})
