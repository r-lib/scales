context("Scale")

test_that("NA.value works for continuous scales", {
  x <- c(NA, seq(0, 1, length.out = 10), NA)
  pal <- rescale_pal()

  expect_that(cscale(x, pal)[1], equals(NA_real_))
  expect_that(cscale(x, pal)[12], equals(NA_real_))
  expect_that(cscale(x, pal, 5)[1], equals(5))
  expect_that(cscale(x, pal, 5)[12], equals(5))
})

test_that("NA.value works for discrete", {
  x <- c(NA, "a", "b", "c", NA)
  pal <- brewer_pal()

  expect_that(dscale(x, pal)[1], equals(NA_character_))
  expect_that(dscale(x, pal)[5], equals(NA_character_))
  expect_that(dscale(x, pal, "grey50")[1], equals("grey50"))
  expect_that(dscale(x, pal, "grey50")[5], equals("grey50"))
})
