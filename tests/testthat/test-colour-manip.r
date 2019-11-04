# hcl ---------------------------------------------------------------------

test_that("can modify each hcl component", {
  expect_equal(col2hcl("red", h = 180), "#00A17D")
  expect_equal(col2hcl("red", l = 50), "#F40000")
  expect_equal(col2hcl("red", c = 50), "#C7624A")
  expect_equal(col2hcl("red", alpha = 0.5), "#FF000080")
})

# alpha -------------------------------------------------------------------

test_that("missing alpha preserves existing", {
  cols <- col2rgb(rep("red", 5), TRUE)
  cols[, 4] <- seq(0, 255, length.out = nrow(cols))

  reds <- rgb2col(cols)

  expect_equal(reds, alpha(reds, NA))
  expect_equal(reds, alpha(reds, rep(NA, 5)))
})

test_that("alpha values recycled to match colour", {
  cols <- rgb2col(col2rgb(c("red", "green", "blue", "pink")))

  expect_equal(cols, alpha(cols, NA))
  expect_equal(cols, alpha(cols, 1))
})

test_that("col values recycled to match alpha", {
  alphas <- round(seq(0, 255, length.out = 3))
  reds <- alpha("red", alphas / 255)
  reds_alpha <- col2rgb(reds, TRUE)[, 4]

  expect_equal(alphas, reds_alpha)
})

test_that("preserves element names", {
  expect_equal(
    c("first", "second", "third"),
    names(alpha(c("first" = "gold", "second" = "lightgray", "third" = "#cd7f32"), .5))
  )
})


test_that("doesn't add element names", {
  pinks <- c("deeppink", "hotpink", "lightpink")

  expect_null(names(alpha(pinks, NA)))
})
