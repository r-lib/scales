test_that("NA.value works for discrete", {
  x <- c(NA, "a", "b", "c", NA)
  pal <- brewer_pal()

  expect_equal(dscale(x, pal)[1], NA_character_)
  expect_equal(dscale(x, pal)[5], NA_character_)
  expect_equal(dscale(x, pal, "grey50")[1], "grey50")
  expect_equal(dscale(x, pal, "grey50")[5], "grey50")
})
