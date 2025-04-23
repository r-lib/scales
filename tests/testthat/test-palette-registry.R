test_that("palette getters and setters work as intended", {
  # Test that palettes have been populated in .onLoad
  expect_in(c("hue", "grey"), palette_names())

  # We cannot get unknown palettes
  expect_snapshot(get_palette("rgb"), error = TRUE)

  # We cannot set nonsense palettes
  expect_snapshot(set_palette("foobar", list(a = 1:2, b = "A")), error = TRUE)

  # Test we can set custom palettes
  colours <- c("red", "green", 'blue')
  set_palette("rgb", palette = colours)
  expect_in("rgb", palette_names())

  # Test we can get custom palettes
  pal <- get_palette("rgb")
  expect_equal(pal(length(colours)), colours)

  # Test we can reset palettes
  reset_palettes()
  expect_false("rgb" %in% palette_names())
})

test_that("as_continuous_pal and as_discrete_pal can retrieve known palettes", {
  colours <- c("#FF0000", "#00FF00", '#0000FF')
  set_palette("rgb", colours)

  pal <- as_discrete_pal("rgb")
  expect_equal(pal(length(colours)), colours)

  pal <- as_continuous_pal("rgb")
  expect_equal(pal(seq(0, 1, length.out = length(colours))), colours)

  reset_palettes()
})
