context("Zero range")

test_that("large numbers with small differences", {
  x <- c(1330020857.8787, 1330020866.8787)
  expect_false(zero_range(x))

  x <- c(1330020857.8787, 1330020857.8787)
  expect_true(zero_range(x))

  expect_true(zero_range(c(1330020857.8787, 1330020857.8787*(1+1e-20))))
})

test_that("small numbers with differences on order of values", {
    expect_false(zero_range(c(5.63e-147, 5.93e-123)))
    expect_false(zero_range(c(-7.254574e-11, 6.035387e-11)))
    expect_false(zero_range(c(-7.254574e-11, -6.035387e-11)))
})

test_that("ranges with 0 endpoint(s)", {
    expect_false(zero_range(c(0,10)))
    expect_true(zero_range(c(0,0)))
    expect_false(zero_range(c(-10,0)))
    expect_false(zero_range(c(0,1)*1e-100))
    expect_false(zero_range(c(0,1)*1e+100))
})

test_that("symmetric ranges", {
    expect_false(zero_range(c(-1,1)))
    expect_false(zero_range(c(-1,1*(1+1e-20))))
    expect_false(zero_range(c(-1,1)*1e-100))
})

test_that("length 1 ranges", {
    expect_true(zero_range(c(1)))
    expect_true(zero_range(c(0)))
    expect_true(zero_range(c(1e100)))
    expect_true(zero_range(c(1e-100)))
})
