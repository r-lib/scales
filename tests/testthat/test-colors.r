context("Colors")

bw <- c("black", "white")

test_that("Edgy col_bin scenarios", {
  # Do these cases make sense?
  expect_equal(col_bin(bw, NULL)(1), "#777777")
  expect_equal(col_bin(bw, 1)(1), "#FFFFFF")
})

test_that("Outside of domain returns na.color", {
  suppressWarnings({
    expect_identical("#808080", col_factor(bw, letters)("foo"))
    expect_identical("#808080", col_quantile(bw, 0:1)(-1))
    expect_identical("#808080", col_quantile(bw, 0:1)(2))
    expect_identical("#808080", col_numeric(bw, c(0, 1))(-1))
    expect_identical("#808080", col_numeric(bw, c(0, 1))(2))
    expect_true(is.na(col_factor(bw, letters, na.color = NA)("foo")))
    expect_true(is.na(col_quantile(bw, 0:1, na.color = NA)(-1)))
    expect_true(is.na(col_quantile(bw, 0:1, na.color = NA)(2)))
    expect_true(is.na(col_numeric(bw, c(0, 1), na.color = NA)(-1)))
    expect_true(is.na(col_numeric(bw, c(0, 1), na.color = NA)(2)))
  })
  expect_warning(col_factor(bw, letters, na.color = NA)("foo"))
  expect_warning(col_quantile(bw, 0:1, na.color = NA)(-1))
  expect_warning(col_quantile(bw, 0:1, na.color = NA)(2))
  expect_warning(col_numeric(bw, c(0, 1), na.color = NA)(-1))
  expect_warning(col_numeric(bw, c(0, 1), na.color = NA)(2))
})

test_that("Basic color accuracy", {
  expect_identical(c("#000000", "#7F7F7F", "#FFFFFF"), col_numeric(colorRamp(bw), NULL)(c(0, 0.5, 1)))

  expect_identical(c("#000000", "#FFFFFF"), col_bin(bw, NULL)(c(1, 2)))
  expect_identical(c("#000000", "#FFFFFF"), col_bin(bw, c(1, 2))(c(1, 2)))
  expect_identical(c("#000000", "#FFFFFF"), col_bin(bw, c(1, 2), 2)(c(1, 2)))
  expect_identical(c("#000000", "#FFFFFF"), col_bin(bw, NULL, bins = c(1, 1.5, 2))(c(1, 2)))
  expect_identical(c("#000000", "#FFFFFF"), col_bin(bw, c(1, 2), bins = c(1, 1.5, 2))(c(1, 2)))

  expect_identical(c("#000000", "#777777", "#FFFFFF"), col_numeric(bw, NULL)(1:3))
  expect_identical(c("#000000", "#777777", "#FFFFFF"), col_numeric(bw, c(1:3))(1:3))
  expect_identical(rev(c("#000000", "#777777", "#FFFFFF")), col_numeric(rev(bw), c(1:3))(1:3))

  # domain != unique(x)
  expect_identical(c("#000000", "#0E0E0E", "#181818"), col_factor(bw, LETTERS)(LETTERS[1:3]))

  # domain == unique(x)
  expect_identical(c("#000000", "#777777", "#FFFFFF"), col_factor(bw, LETTERS[1:3])(LETTERS[1:3]))

  # no domain
  expect_identical(c("#000000", "#777777", "#FFFFFF"), col_factor(bw, NULL)(LETTERS[1:3]))

  # Non-factor domains are sorted unless instructed otherwise
  expect_identical(c("#000000", "#777777", "#FFFFFF"), col_factor(bw, rev(LETTERS[1:3]))(LETTERS[1:3]))
  expect_identical(rev(c("#000000", "#777777", "#FFFFFF")), col_factor(bw, rev(LETTERS[1:3]), ordered = TRUE)(LETTERS[1:3]))
})

test_that("CIELab overflow", {
  expect_identical(c("#FFFFFF", "#CFB1FF", "#9165FF", "#0000FF"), scales::colour_ramp(c("white", "blue"))(0:3 / 3))
})
