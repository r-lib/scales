context("Mutable scales")

test_that("training updates limits", {
  scale <- ContinuousScale$new(size_pal())

  scale$train(c(0, 10))  
  expect_equal(scale$limits(), c(0, 10))

  scale$train(c(0, 20))  
  expect_equal(scale$limits(), c(0, 20))

  scale$train(-20)  
  expect_equal(scale$limits(), c(-20, 20))

  scale$train(NA_real_)
  expect_equal(scale$limits(), c(-20, 20))
})

test_that("user limits override data limits", {
  scale <- ContinuousScale$new(size_pal())
  scale$train(c(0, 10))
  scale$user_limits <- c(1, 5)
  
  expect_equal(scale$limits(), c(1, 5))  
})

test_that("default breaks use transformation defaults", {
  scale <- ContinuousScale$new(size_pal())
  scale$train(c(0, 10))

  expect_equal(scale$breaks(), pretty_breaks()(scale$limits()))
  
  scale <- ContinuousScale$new(size_pal(), log10_trans())
  scale$train(scale$transform(c(1, 1e5)))

  expect_equal(scale$breaks(), integer_breaks()(c(0, 5)))
  
})