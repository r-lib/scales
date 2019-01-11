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

test_that("preserves element names", {
  expect_equal(c("first", "second", "third"), names(alpha(c(first   = "gold", second   = "lightgray", third   = "#cd7f32"), .5)))   # not quoted
  expect_equal(c("first", "second", "third"), names(alpha(c("first" = "gold", "second" = "lightgray", "third" = "#cd7f32"), .5)))   # quoted
  expect_equal(as.character(1:3)            , names(alpha(c("1"     = "gold", "2"      = "lightgray", "3"     = "#cd7f32"), .5)))   # numeric characters
  expect_equal(as.character(1:3)            , names(alpha(c(`1`     = "gold", `2`      = "lightgray", `3`     = "#cd7f32"), .5)))   # in backticks

  expect_equal(c(""     , "second", "third"), names(alpha(c(          "gold", second   = "lightgray", third   = "#cd7f32"), .5)))   # first element name is missing
  expect_equal(c("first", ""      , "third"), names(alpha(c(first   = "gold",            "lightgray", third   = "#cd7f32"), .5)))   # middle element name is missing
  expect_equal(c("first", "second", ""     ), names(alpha(c(first   = "gold", second   = "lightgray",           "#cd7f32"), .5)))   # last element name is missing
  expect_equal(c("NULL" , "second", ""     ), names(alpha(c(NULL    = "gold", second   = "lightgray",           "#cd7f32"), .5)))   # last element looks like 'NULL', but is really a character
})


test_that("doesn't add element names", {
  pinks <- c("deeppink", "hotpink", "lightpink")

  expect_null(names(alpha(pinks, NA)))
})
