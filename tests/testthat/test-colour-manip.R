# hcl ---------------------------------------------------------------------

test_that("can modify each hcl component", {
  expect_equal(col2hcl("red", h = 180), "#00B793")
  expect_equal(col2hcl("red", l = 50), "#F40000")
  expect_equal(col2hcl("red", c = 50), "#B36B6B")
  expect_equal(col2hcl("red", alpha = 0.5), "#FF000080")
})

# alpha -------------------------------------------------------------------

test_that("missing alpha preserves existing", {
  rgb <- farver::decode_colour(rep("red", 5), to = "rgb")
  alpha <- seq(0, 1, length.out = nrow(rgb))
  reds <- farver::encode_colour(rgb, alpha)

  expect_equal(reds, alpha(reds, NA))
  expect_equal(reds, alpha(reds, rep(NA, 5)))
})

test_that("alpha values recycled to match colour", {
  cols <- farver::encode_colour(farver::decode_colour(c(
    "red",
    "green",
    "blue",
    "pink"
  )))

  expect_equal(cols, alpha(cols, NA))
  expect_equal(cols, alpha(cols, 1))
})

test_that("col values recycled to match alpha", {
  alphas <- round(seq(0, 1, length.out = 3))
  reds <- alpha("red", alphas)
  reds_alpha <- farver::decode_colour(reds, TRUE)[, 4]

  expect_equal(alphas, reds_alpha)
})

test_that("preserves names", {
  x <- c("deeppink", "hotpink", "lightpink")
  expect_named(alpha(x, 0.5), NULL)

  names(x) <- x
  expect_named(alpha(x, 0.5), names(x))
})

# col_mix -----------------------------------------------------------------

test_that("col_mix interpolates colours", {
  x <- col_mix("red", c("blue", "green"))
  y <- col_mix(c("blue", "green"), "red")
  expect_equal(x, y)
  expect_equal(x, c("#800080", "#808000"))
  x <- col_mix("red", "blue", amount = 0.75)
  expect_equal(x, "#4000BFFF")
})

test_that("col_shift shifts colours correctly", {
  x <- c("#FF0000", "#00FF00", "#0000FF")
  expect_equal(col_shift(x, 360), x)
  expect_equal(col_shift(x, 180), c("#00B8B8", "#FF92FF", "#535300"))
})

test_that("col_lighter and col_darker adjust lightness correctly", {
  x <- c("#FF0000", "#00FF00", "#0000FF")
  expect_equal(col_lighter(x, 30), c("#FF9999", "#99FF99", "#9999FF"))
  expect_equal(col_darker(x, 30), c("#660000", "#006600", "#000066"))
})

test_that("col_saturate can (de)saturate colours", {
  x <- c("#BF4040", "#40BF40", "#4040BF")
  expect_equal(col_saturate(x, 30), c("#E51A1A", "#1AE51A", "#1A1AE5"))
  expect_equal(col_saturate(x, -30), c("#996666", "#669966", "#666699"))
})

test_that("colour manipulation functions work on palettes", {
  pal <- pal_manual(c("#FF0000", "#00FF00", "#0000FF"))

  expect_equal(col_shift(pal, 180)(3), c("#00B8B8", "#FF92FF", "#535300"))
  expect_equal(col_darker(pal, 30)(3), c("#660000", "#006600", "#000066"))
  expect_equal(col_lighter(pal, 30)(3), c("#FF9999", "#99FF99", "#9999FF"))
  expect_equal(col_saturate(pal, -50)(3), c("#BF4040", "#40BF40", "#4040BF"))
  expect_equal(col_mix(pal, "white")(3), c("#FF8080", "#80FF80", "#8080FF"))
})
