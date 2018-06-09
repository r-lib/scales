context("Colour ramp")

test_that("Special values yield NAs", {
  pal <- seq_gradient_pal()

  expect_equal(pal(NA), NA_character_)
  expect_equal(pal(NaN), NA_character_)
  expect_equal(pal(Inf), NA_character_)
  expect_equal(pal(-Inf), NA_character_)
})

test_that("Fully opaque colors are returned without alpha", {
  expect_identical(
    colour_ramp(c("#1234AB", "#BA4321"))(0:1),
    c("#1234AB", "#BA4321")
  )
})

test_that("Partially transparent colors are returned with alpha", {
  expect_identical(
    colour_ramp(c("#1234AB20", "#BA43218F"))(0:1),
    c("#1234AB20", "#BA43218F")
  )
})

test_that("Partially transparent colors are returned without alpha when `alpha = FALSE`", {
  expect_identical(
    colour_ramp(c("#1234AB20", "#BA43218F"), alpha = FALSE)(0:1),
    c("#1234AB", "#BA4321")
  )
})

test_that("Interpolation works from color without to color with alpha channel", {
  expect_identical(
    colour_ramp(c("#1234AB", "#1234AB00"))(0.5),
    "#1234AB80"
  )
})
