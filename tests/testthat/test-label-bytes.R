test_that("auto units always rounds down", {
  expect_equal(label_bytes()(1000^(1:3)), c("1 kB", "1 MB", "1 GB"))
})

test_that("auto units handles 0 and other special values", {
  expect_equal(label_bytes()(NA_real_), NA_character_)
  expect_equal(label_bytes()(0), "0 B")
  expect_equal(label_bytes()(-1), "-1 B")
  expect_equal(label_bytes()(Inf), "Inf")
})

test_that("can use either binary or si units", {
  expect_equal(label_bytes("kB")(1000), "1 kB")
  expect_equal(label_bytes("kiB")(1024), "1 kiB")
})

test_that("compatible with scale argument", {
  expect_equal(label_bytes("auto_si", scale = 2)(500), "1 kB")
  expect_equal(label_bytes("auto_binary", scale = 2)(512), "1 kiB")
})

test_that("errors if unknown unit", {
  expect_error(label_bytes("unit")(0), "valid unit")
})

# deprecated interface ----------------------------------------------------

test_that("Byte formatter can take a symbol designator", {
  expect_equal(
    number_bytes(c(50, 400, 502, NA), symbol = "B"),
    c("50 B", "400 B", "502 B", NA)
  )
  expect_equal(
    number_bytes(3:5 * 1024^2, symbol = "MiB"),
    c("3 MiB", "4 MiB", "5 MiB")
  )
  expect_equal(
    number_bytes(1000^(1:3), symbol = "kB", units = "si"),
    c("1 kB", "1 000 kB", "1 000 000 kB")
  )

  # informative warning for incorrect spelling
  expect_warning(number_bytes(c(50, 400, 502, NA), symbol = "k"), "must be")

  # respects unit designation
  expect_equal(number_bytes(1024, accuracy = .01), c("1.00 KiB"))
  expect_equal(number_bytes(1024, units = "si", accuracy = .01), c("1.02 kB"))
  expect_equal(number_bytes(1000, units = "si", accuracy = .01), c("1.00 kB"))

  # takes parameters from number()
  expect_equal(
    number_bytes(c(3e6, 4e6, 5e6), accuracy = .001),
    c("2.861 MiB", "3.815 MiB", "4.768 MiB")
  )
  expect_equal(
    number_bytes(c(3e6, 4e6, 5e6), units = "si", accuracy = .1),
    c("3.0 MB", "4.0 MB", "5.0 MB")
  )

  # unit system is enforced
  expect_warning(number_bytes(1024^(1:2), "kB", units = "binary"), "KiB")
  expect_warning(number_bytes(1024^(1:2), "KiB", units = "si"), "kB")
})

test_that("Byte formatter handles zero values", {
  expect_equal(number_bytes(0), "0 B")
})

test_that("Byte formatter handles large values", {
  expect_equal(number_bytes(1024^11), "1 073 741 824 YiB")
  expect_equal(number_bytes(1000^9, units = "si"), "1 000 YB")
})

test_that("Byte formatter handles negative values", {
  expect_equal(number_bytes(-1024^2), "-1 MiB")
})

test_that('Byte formatter symbol = "auto" can show variable multiples', {
  expect_equal(number_bytes(1024^(1:3)), c("1 KiB", "1 MiB", "1 GiB"))
})

test_that("Byte formatter throws informative error for wrong length symbol", {
  expect_error(number_bytes(symbol = character()), "not length 0")
  expect_error(number_bytes(symbol = c("kB", "MB")), "not length 2")
})

test_that("preserves names", {
  expect_named(number_bytes(c(a = 1)), "a")
})
