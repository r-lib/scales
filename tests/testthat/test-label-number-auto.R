test_that("gracefully handles bad input works", {
  number_auto <- label_number_auto()
  expect_equal(number_auto(NULL), character())
  expect_equal(number_auto(numeric()), character())
  expect_equal(number_auto(NA), "NA")
  expect_equal(number_auto(Inf), "Inf")
})

test_that("tricky breaks don't change unexpectedly", {
  verify_output(test_path("test-label-number-auto.txt"), {
    number_auto <- label_number_auto()
    number_auto(c(0, 0.000001))
    number_auto(c(0.0009, 0.0010, 0.0011))
    number_auto(c(0.00009, 0.00010, 0.00011))
    number_auto(c(0.000009, 0.000010, 0.000011))

    number_auto(c(999, 1000, 1001))
    number_auto(c(999999, 1000000, 1000001))
    number_auto(c(9999999, 10000000, 10000001))
    number_auto(c(99999999, 100000000, 100000001))
    number_auto(c(0.0000009, 0.0000010, 0.0000011))

    "Years shouldn't get commas"
    number_auto(c(2010, 2013, 2020))
    number_auto(c(-2010, -2013, -2020))

    "Pick shortest individually"
    number_auto(10^(1:7))
  })
})
