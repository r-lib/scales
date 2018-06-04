context("Alpha")

hex <- function(x) {
  rgb <- col2rgb(x, TRUE) / 255
  rgb(rgb[1, ], rgb[2, ], rgb[3, ], rgb[4, ])
}

test_that("missing alpha preserves existing", {
  cols <- col2rgb(rep("red", 5), TRUE) / 255
  cols[4, ] <- seq(0, 1, length.out = ncol(cols))

  reds <- rgb(cols[1, ], cols[2, ], cols[3, ], cols[4, ])

  expect_equal(reds, alpha(reds, NA))
  expect_equal(reds, alpha(reds, rep(NA, 5)))
})

test_that("alpha values recycled to match colour", {
  cols <- hex(c("red", "green", "blue", "pink"))

  expect_equal(cols, alpha(cols, NA))
  expect_equal(cols, alpha(cols, 1))
})

test_that("col values recycled to match alpha", {
  alphas <- round(seq(0, 255, length.out = 3))
  reds <- alpha("red", alphas / 255)
  reds_alpha <- col2rgb(reds, TRUE)[4, ]

  expect_equal(alphas, reds_alpha)
})
