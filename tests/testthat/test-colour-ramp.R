context("Colour ramp")

test_that("Special values yield NAs", {
  pal <- seq_gradient_pal()

  expect_equal(pal(NA), NA_character_)
  expect_equal(pal(NaN), NA_character_)
  expect_equal(pal(Inf), NA_character_)
  expect_equal(pal(-Inf), NA_character_)
})
