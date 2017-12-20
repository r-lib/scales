context("Colour ramp")

test_that("Special values yield NAs", {
  pal <- seq_gradient_pal()

  expect_equal(pal(NA), NA_character_)
  expect_equal(pal(NaN), NA_character_)
  expect_equal(pal(Inf), NA_character_)
  expect_equal(pal(-Inf), NA_character_)
})

test_that("Interpolation works with and without transparency", {
  # fully opaque colors are returned without alpha
  expect_identical(c("#1234AB", "#BA4321"), scales::colour_ramp(c("#1234AB", "#BA4321"))(0:1))

  # partially transparent colors are returned with alpha
  expect_identical(c("#1234AB20", "#BA43218F"), scales::colour_ramp(c("#1234AB20", "#BA43218F"))(0:1))

  # partially transparent colors are returned without alpha when `alpha = FALSE`
  expect_identical(c("#1234AB", "#BA4321"), scales::colour_ramp(c("#1234AB20", "#BA43218F"), alpha = FALSE)(0:1))

  # interpolation works from color without to color with alpha channel
  expect_identical("#1234AB80", scales::colour_ramp(c("#1234AB", "#1234AB00"))(0.5))
})
