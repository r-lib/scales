context("Hue pal")

test_that("hue_pal arguments are forcely evaluated on each call #81", {
  col1 <- hue_pal(h.start = 0)
  col2 <- hue_pal(h.start = 90)

  colours <- list()
  hues <- c(0, 90)
  for (i in 1:2) {
    colours[[i]] <- hue_pal(h.start = hues[i])
  }
  expect_equal(col1(1), colours[[1]](1))
  expect_equal(col2(1), colours[[2]](1))
})


