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
  expect_snapshot(col_factor(bw, letters, na.color = NA)("foo"))
  expect_snapshot(col_quantile(bw, 0:1, na.color = NA)(-1))
  expect_snapshot(col_quantile(bw, 0:1, na.color = NA)(2))
  expect_snapshot(col_numeric(bw, c(0, 1), na.color = NA)(-1))
  expect_snapshot(col_numeric(bw, c(0, 1), na.color = NA)(2))
})

test_that("Basic color accuracy", {
  expect_identical(
    c("#000000", "#808080", "#FFFFFF"),
    col_numeric(colorRamp(bw), NULL)(c(0, 0.5, 1))
  )

  expect_identical(c("#000000", "#FFFFFF"), col_bin(bw, NULL)(c(1, 2)))
  expect_identical(c("#000000", "#FFFFFF"), col_bin(bw, c(1, 2))(c(1, 2)))
  expect_identical(c("#000000", "#FFFFFF"), col_bin(bw, c(1, 2), 2)(c(1, 2)))
  expect_identical(
    c("#000000", "#FFFFFF"),
    col_bin(bw, NULL, bins = c(1, 1.5, 2))(c(1, 2))
  )
  expect_identical(
    c("#000000", "#FFFFFF"),
    col_bin(bw, c(1, 2), bins = c(1, 1.5, 2))(c(1, 2))
  )

  expect_identical(
    c("#000000", "#777777", "#FFFFFF"),
    col_numeric(bw, NULL)(1:3)
  )
  expect_identical(
    c("#000000", "#777777", "#FFFFFF"),
    col_numeric(bw, c(1:3))(1:3)
  )
  expect_identical(
    rev(c("#000000", "#777777", "#FFFFFF")),
    col_numeric(rev(bw), c(1:3))(1:3)
  )

  # domain != unique(x)
  expect_identical(
    c("#000000", "#0E0E0E", "#181818"),
    col_factor(bw, LETTERS)(LETTERS[1:3])
  )

  # domain == unique(x)
  expect_identical(
    c("#000000", "#777777", "#FFFFFF"),
    col_factor(bw, LETTERS[1:3])(LETTERS[1:3])
  )

  # no domain
  expect_identical(
    c("#000000", "#777777", "#FFFFFF"),
    col_factor(bw, NULL)(LETTERS[1:3])
  )

  # Non-factor domains are sorted unless instructed otherwise
  expect_identical(
    c("#000000", "#777777", "#FFFFFF"),
    col_factor(bw, rev(LETTERS[1:3]))(LETTERS[1:3])
  )
  expect_identical(
    rev(c("#000000", "#777777", "#FFFFFF")),
    col_factor(bw, rev(LETTERS[1:3]), ordered = TRUE)(LETTERS[1:3])
  )
})

test_that("col_numeric respects alpha", {
  expect_equal(
    col_numeric(c("#FF000000", "#FF0000FF"), c(0, 1), alpha = TRUE)(0.5),
    "#FF000080"
  )
})

test_that("CIELab overflow", {
  expect_identical(
    c("#FFFFFF", "#CFB1FF", "#9265FF", "#0000FF"),
    colour_ramp(c("white", "blue"))(0:3 / 3)
  )
})

test_that("factors match by name, not position", {
  full <- factor(letters[1:5])
  pal <- col_factor("magma", na.color = NA, levels = full)

  partial <- full[2:4]
  expect_identical(pal(partial), pal(droplevels(partial)))

  # Sending in values outside of the color scale should result in a warning and na.color
  expect_snapshot(col <- pal(letters[10:20]))
  expect_true(all(is.na(col)))
})

test_that("qualitative palettes don't interpolate", {
  pal <- col_factor("Accent", na.color = NA, levels = letters[1:5])

  allColors <- RColorBrewer::brewer.pal(
    n = RColorBrewer::brewer.pal.info["Accent", "maxcolors"],
    name = "Accent"
  )

  # If we're not interpolating, then the colors for each level should match
  # exactly with the color in the corresponding position in the palette.
  expect_identical(pal(letters[1:5]), allColors[1:5])

  # Same behavior when domain is provided initially
  expect_identical(
    col_factor("Accent", domain = rep(letters[1:5], 2))(letters[1:5]),
    allColors[1:5]
  )
  # Same behavior when domain is provided initially, and is a factor
  expect_identical(
    col_factor("Accent", domain = factor(rep(letters[5:1], 2)))(letters[1:5]),
    allColors[1:5]
  )
  # Same behavior when domain is provided initially, and is not a factor
  expect_identical(
    col_factor("Accent", domain = rep(letters[5:1], 2), ordered = TRUE)(letters[
      5:1
    ]),
    allColors[1:5]
  )
  # Same behavior when no domain or level is provided initially
  expect_identical(
    col_factor("Accent", NULL)(letters[1:5]),
    allColors[1:5]
  )

  # Values outside of the originally provided levels should be NA with warning
  expect_snapshot(pal(letters[6]))
  expect_true(suppressWarnings(is.na(pal(letters[6]))))
})

test_that("OK, qualitative palettes sometimes interpolate", {
  pal <- col_factor("Accent", na.color = NA, levels = letters[1:20])

  allColors <- RColorBrewer::brewer.pal(
    n = RColorBrewer::brewer.pal.info["Accent", "maxcolors"],
    name = "Accent"
  )

  expect_snapshot(result <- pal(letters[1:20]))
  # The first and last levels are the first and last palette colors
  expect_true(all(result[c(1, 20)] %in% allColors))
  # All the rest are interpolated though
  expect_true(!any(result[-c(1, 20)] %in% allColors))
})

verifyReversal <- function(colorFunc, values, ..., filter = identity) {
  f1 <- filter(colorFunc("Blues", domain = values, ...)(values))
  f2 <- filter(colorFunc("Blues", domain = NULL, ...)(values))
  f3 <- filter(colorFunc("Blues", domain = values, reverse = FALSE, ...)(
    values
  ))
  f4 <- filter(colorFunc("Blues", domain = NULL, reverse = FALSE, ...)(values))
  r1 <- filter(colorFunc("Blues", domain = values, reverse = TRUE, ...)(values))
  r2 <- filter(colorFunc("Blues", domain = NULL, reverse = TRUE, ...)(values))

  expect_identical(f1, f2)
  expect_identical(f1, f3)
  expect_identical(f1, f4)
  expect_identical(r1, r2)
  expect_identical(f1, rev(r1))
}

test_that("col_numeric can be reversed", {
  verifyReversal(col_numeric, 1:10)
})

test_that("col_bin can be reversed", {
  # col_bin needs to filter because with 10 values and 7 bins, there is some
  # repetition that occurs in the results. Hard to explain but easy to see:
  # scales::show_col(col_bin("Blues", NULL)(1:8))
  # scales::show_col(col_bin("Blues", NULL, reverse = TRUE)(1:8))

  verifyReversal(col_bin, 1:10, filter = unique)
})

test_that("col_quantile can be reversed", {
  verifyReversal(col_quantile, 1:10, n = 7)
})

test_that("col_factor can be reversed", {
  # With interpolation
  verifyReversal(col_factor, letters[1:8])

  # Without interpolation
  accent <- suppressWarnings(RColorBrewer::brewer.pal(Inf, "Accent"))
  result1 <- col_factor("Accent", NULL)(letters[1:5])
  expect_identical(result1, head(accent, 5))
  # Reversing a qualitative palette means we should pull the same colors, but
  # apply them in reverse order
  result2 <- col_factor("Accent", NULL, reverse = TRUE)(letters[1:5])
  expect_identical(result2, rev(head(accent, 5)))
})

test_that("Palettes with ncolor < 3 work properly", {
  test_palette <- function(palette) {
    colors <- col_factor(palette, letters[1:2])(letters[1:2])
    # brewer.pal returns minimum 3 colors, and warns if you request less than 3.
    expected_colors <- suppressWarnings(RColorBrewer::brewer.pal(2, palette))[
      1:2
    ]
    # The expected behavior is that the first two colors in the palette are returned.
    # This is different than the behavior in Leaflet color* functions; in those
    # functions, when 2 colors are needed from an RColorBrewer palette, the first and
    # third colors are used. Using the first and third is arguably a better choice
    # for sequential and diverging palettes, and very arguably worse for qualitative.
    # The scales' col_* functions use the first 2 colors for consistency with
    # scales::brewer_pal.
    expect_identical(colors, expected_colors)

    colors <- col_bin(palette, 1:2, bins = 2)(1:2)
    expect_identical(colors, expected_colors)
  }
  # Qualitative palette
  test_palette("Accent")
  # Sequential palette
  test_palette("Blues")
  # Diverging palette
  test_palette("Spectral")
})

test_that("col_quantile handles skewed data", {
  expect_snapshot({
    x <- c(1:5, rep(10, 10))
    col <- col_quantile("RdYlBu", domain = x, n = 7)(x)
    col <- col_quantile("RdYlBu", domain = NULL, n = 7)(x)
  })
})

test_that("Arguments to `cut` are respected", {
  colors1 <- col_bin("Greens", 1:3, 1:3)(1:3)
  # Intervals are [1,2) and [2,3], so 2 and 3 are the same
  expect_identical(colors1, c("#E5F5E0", "#A1D99B", "#A1D99B"))

  colors2 <- col_bin("Blues", 1:3, 1:3, right = TRUE)(1:3)
  # Intervals are [1,2] and (2,3], so 1 and 2 are the same
  expect_identical(colors2, c("#DEEBF7", "#DEEBF7", "#9ECAE1"))

  # Shows that you can use cut + col_factor to achieve finer grained
  # control than with col_bin
  pal <- col_factor("Reds", domain = NULL, na.color = NA)
  colorsTT <- pal(cut(1:3, 1:3, include.lowest = TRUE, right = TRUE))
  expect_identical(colorsTT, c("#FEE0D2", "#FEE0D2", "#FC9272"))
  colorsTF <- pal(cut(1:3, 1:3, include.lowest = TRUE, right = FALSE))
  expect_identical(colorsTF, c("#FEE0D2", "#FC9272", "#FC9272"))
  colorsFT <- pal(cut(1:3, 1:3, include.lowest = FALSE, right = TRUE))
  expect_identical(colorsFT, c(NA, "#FEE0D2", "#FC9272"))
  colorsFF <- pal(cut(1:3, 1:3, include.lowest = FALSE, right = FALSE))
  expect_identical(colorsFF, c("#FEE0D2", "#FC9272", NA))
})
