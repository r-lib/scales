
test_that("negative percents work", {
  expect_equal(percent(-0.6, accuracy = 1), "-60%")
})

test_that("Single 0 gives 0%", {
  expect_equal(percent(0), "0%")
})

test_that("preserves NAs", {
  expect_equal(percent(c(NA, 1, 2, 3)), c(NA, "100%", "200%", "300%"))
  expect_equal(percent(NA_real_), NA_character_)
})

test_that("preserves names", {
  expect_named(percent(c(a = 1)), "a")
})

test_that("default accuracy works for range of inputs", {
  x <- c(0.1, 0.2, 0.5)
  expect_equal(percent(x / 100), c("0.10%", "0.20%", "0.50%"))
  expect_equal(percent(x / 10), c("1.0%", "2.0%", "5.0%"))
  expect_equal(percent(x), c("10%", "20%", "50%"))
  expect_equal(percent(x * 10), c("100%", "200%", "500%"))
})

test_that("plus works - percent()", {
  expect_equal(
    percent(c(-.25, .25), plus = TRUE),
    c("-25%", "+25%")
  )

  expect_warning(
    percent(c(-.25, .25), plus = TRUE, prefix = "$"),
    "`prefix` and `plus = TRUE` both specified; `plus` takes precedence"
  )
})


test_that("plus works - label_percent()", {
  expect_equal(
    label_percent(plus = TRUE)(c(-.25, .25)),
    c("-25%", "+25%")
  )

  expect_warning(
    label_percent(plus = TRUE, prefix = "$")(c(-.25, .25)),
    "`prefix` and `plus = TRUE` both specified; `plus` takes precedence"
  )
})
