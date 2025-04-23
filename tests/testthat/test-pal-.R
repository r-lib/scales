test_that("continuous palettes can be created, tested and coerced", {
  pal <- new_continuous_palette(
    function(x) ((x - 0.5) * 4)^2,
    "numeric",
    na_safe = FALSE
  )
  expect_equal(pal(seq(0, 1, by = 0.25)), c(4, 1, 0, 1, 4))

  expect_true(is_pal(pal))
  expect_true(is_continuous_pal(pal))
  expect_false(is_discrete_pal(pal))
  expect_false(is_colour_pal(pal))
  expect_true(is_numeric_pal(pal))

  expect_equal(palette_type(pal), "numeric")
  expect_equal(palette_na_safe(pal), FALSE)
  expect_equal(palette_nlevels(pal), NA_integer_)

  new <- as_discrete_pal(pal)
  expect_true(is_discrete_pal(new))
  expect_equal(new(5), c(4, 1, 0, 1, 4))
})

test_that("discrete palettes can be created, tested and coerced", {
  pal <- new_discrete_palette(
    function(n) c("red", "green", "blue")[seq_len(n)],
    "colour",
    nlevels = 3
  )
  expect_equal(pal(2), c("red", "green"))

  expect_true(is_pal(pal))
  expect_true(is_discrete_pal(pal))
  expect_false(is_continuous_pal(pal))
  expect_true(is_colour_pal(pal))
  expect_false(is_numeric_pal(pal))

  expect_equal(palette_type(pal), "colour")
  expect_equal(palette_na_safe(pal), FALSE)
  expect_equal(palette_nlevels(pal), 3)

  new <- as_continuous_pal(pal)
  expect_true(is_continuous_pal(new))
  expect_equal(new(c(0, 0.5, 1)), c("#FF0000", "#00FF00", "#0000FF"))
})
