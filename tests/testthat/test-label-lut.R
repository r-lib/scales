test_that("label_lut gives correct answers", {

  short <- c("A", "B", "C")
  lut <- c("A" = "Apple", "C" = "Cherry", "D" = "Date")

  expect_equal(label_lut(lut)(short), c("Apple", "B", "Cherry"))
  expect_equal(
    label_lut(lut, nomatch = "Banana")(short),
    c("Apple", "Banana", "Cherry")
  )
})
