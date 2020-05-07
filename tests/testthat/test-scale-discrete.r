test_that("NA.value works for discrete", {
  x <- c(NA, "a", "b", "c", NA)
  pal <- brewer_pal()

  expect_that(dscale(x, pal)[1], equals(NA_character_))
  expect_that(dscale(x, pal)[5], equals(NA_character_))
  expect_that(dscale(x, pal, "grey50")[1], equals("grey50"))
  expect_that(dscale(x, pal, "grey50")[5], equals("grey50"))
})
