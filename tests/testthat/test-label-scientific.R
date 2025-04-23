test_that("scientific format shows specific sig figs", {
  expect_equal(label_scientific(digits = 1)(123456), "1e+05")
  expect_equal(label_scientific(digits = 2)(123456), "1.2e+05")
  expect_equal(label_scientific(digits = 3)(123456), "1.23e+05")

  expect_equal(label_scientific(digits = 1)(0.123456), "1e-01")
  expect_equal(label_scientific(digits = 2)(0.123456), "1.2e-01")
  expect_equal(label_scientific(digits = 3)(0.123456), "1.23e-01")
})

test_that("prefix and suffix works with scientific format", {
  expect_equal(scientific(123456, digits = 2, prefix = "V="), "V=1.2e+05")
  expect_equal(scientific(123456, digits = 2, suffix = " km"), "1.2e+05 km")
})

test_that("scale works with scientific format", {
  expect_equal(scientific(123456, digits = 2, scale = 1000), "1.2e+08")
})

test_that("decimal.mark works with scientific format", {
  expect_equal(scientific(123456, digits = 2, decimal.mark = ","), "1,2e+05")
})

test_that("scientific format respects NAs", {
  expect_equal(scientific(NA), NA_character_)
})

test_that("scientific preserves names", {
  expect_named(scientific(c(a = 1)), "a")
})
