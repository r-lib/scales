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
  expect_equal(percent(x / 100), c("0.1%", "0.2%", "0.5%"))
  expect_equal(percent(x / 10), c("1%", "2%", "5%"))
  expect_equal(percent(x), c("10%", "20%", "50%"))
  expect_equal(percent(x * 10), c("100%", "200%", "500%"))
})
