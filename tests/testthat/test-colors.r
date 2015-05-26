context("Colors")

bw = c("black", "white")

test_that("Edgy colorBin scenarios", {
  # Do these cases make sense?
  expect_equal(colorBin(bw, NULL)(1), "#777777")
  expect_equal(colorBin(bw, 1)(1), "#FFFFFF")
})

test_that("Outside of domain returns na.color", {
  suppressWarnings({
    expect_identical("#808080", colorFactor(bw, letters)("foo"))
    expect_identical("#808080", colorQuantile(bw, 0:1)(-1))
    expect_identical("#808080", colorQuantile(bw, 0:1)(2))
    expect_identical("#808080", colorNumeric(bw, c(0, 1))(-1))
    expect_identical("#808080", colorNumeric(bw, c(0, 1))(2))
    expect_true(is.na(colorFactor(bw, letters, na.color = NA)("foo")))
    expect_true(is.na(colorQuantile(bw, 0:1, na.color = NA)(-1)))
    expect_true(is.na(colorQuantile(bw, 0:1, na.color = NA)(2)))
    expect_true(is.na(colorNumeric(bw, c(0, 1), na.color = NA)(-1)))
    expect_true(is.na(colorNumeric(bw, c(0, 1), na.color = NA)(2)))
  })
  expect_warning(colorFactor(bw, letters, na.color = NA)("foo"))
  expect_warning(colorQuantile(bw, 0:1, na.color = NA)(-1))
  expect_warning(colorQuantile(bw, 0:1, na.color = NA)(2))
  expect_warning(colorNumeric(bw, c(0, 1), na.color = NA)(-1))
  expect_warning(colorNumeric(bw, c(0, 1), na.color = NA)(2))
})

test_that("Basic color accuracy", {
  expect_identical(c("#000000", "#7F7F7F", "#FFFFFF"), colorNumeric(colorRamp(bw), NULL)(c(0, 0.5, 1)))

  expect_identical(c("#000000", "#FFFFFF"), colorBin(bw, NULL)(c(1,2)))
  expect_identical(c("#000000", "#FFFFFF"), colorBin(bw, c(1,2))(c(1,2)))
  expect_identical(c("#000000", "#FFFFFF"), colorBin(bw, c(1,2), 2)(c(1,2)))
  expect_identical(c("#000000", "#FFFFFF"), colorBin(bw, NULL, bins=c(1,1.5,2))(c(1,2)))
  expect_identical(c("#000000", "#FFFFFF"), colorBin(bw, c(1,2), bins=c(1,1.5,2))(c(1,2)))

  expect_identical(c("#000000", "#777777", "#FFFFFF"), colorNumeric(bw, NULL)(1:3))
  expect_identical(c("#000000", "#777777", "#FFFFFF"), colorNumeric(bw, c(1:3))(1:3))
  expect_identical(rev(c("#000000", "#777777", "#FFFFFF")), colorNumeric(rev(bw), c(1:3))(1:3))

  # domain != unique(x)
  expect_identical(c("#000000", "#0E0E0E", "#181818"), colorFactor(bw, LETTERS)(LETTERS[1:3]))

  # domain == unique(x)
  expect_identical(c("#000000", "#777777", "#FFFFFF"), colorFactor(bw, LETTERS[1:3])(LETTERS[1:3]))

  # no domain
  expect_identical(c("#000000", "#777777", "#FFFFFF"), colorFactor(bw, NULL)(LETTERS[1:3]))

  # Non-factor domains are sorted unless instructed otherwise
  expect_identical(c("#000000", "#777777", "#FFFFFF"), colorFactor(bw, rev(LETTERS[1:3]))(LETTERS[1:3]))
  expect_identical(rev(c("#000000", "#777777", "#FFFFFF")), colorFactor(bw, rev(LETTERS[1:3]), ordered = TRUE)(LETTERS[1:3]))
})
