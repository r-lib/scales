test_that("unit format", {
  expect_equal(
    unit_format(unit = "km", scale = 1e-3)(c(1e3, NA, 2e3)),
    c("1.0 km", NA, "2.0 km")
  )
  expect_equal(
    unit_format(unit = "ha", scale = 1e-4, accuracy = .1)(c(1e3, 2e3)),
    c("0.1 ha", "0.2 ha")
  )
  expect_equal(
    unit_format()(c(1e2, 2e2)),
    c("100 m", "200 m")
  )
})

test_that("unit_format preserves names", {
  expect_named(unit_format()(c(a = 1)), "a")
})
