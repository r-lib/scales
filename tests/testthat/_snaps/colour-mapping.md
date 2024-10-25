# Outside of domain returns na.color

    Code
      col_factor(bw, letters, na.color = NA)("foo")
    Condition
      Warning:
      Some values were outside the color scale and will be treated as NA
    Output
      [1] NA

---

    Code
      col_quantile(bw, 0:1, na.color = NA)(-1)
    Condition
      Warning:
      Some values were outside the color scale and will be treated as NA
    Output
      [1] NA

---

    Code
      col_quantile(bw, 0:1, na.color = NA)(2)
    Condition
      Warning:
      Some values were outside the color scale and will be treated as NA
    Output
      [1] NA

---

    Code
      col_numeric(bw, c(0, 1), na.color = NA)(-1)
    Condition
      Warning:
      Some values were outside the color scale and will be treated as NA
    Output
      [1] NA

---

    Code
      col_numeric(bw, c(0, 1), na.color = NA)(2)
    Condition
      Warning:
      Some values were outside the color scale and will be treated as NA
    Output
      [1] NA

# factors match by name, not position

    Code
      col <- pal(letters[10:20])
    Condition
      Warning:
      Some values were outside the color scale and will be treated as NA

# qualitative palettes don't interpolate

    Code
      pal(letters[6])
    Condition
      Warning:
      Some values were outside the color scale and will be treated as NA
    Output
      [1] NA

# OK, qualitative palettes sometimes interpolate

    Code
      result <- pal(letters[1:20])
    Condition
      Warning in `RColorBrewer::brewer.pal()`:
      n too large, allowed maximum for palette Accent is 8
      Returning the palette you asked for with that many colors

# col_quantile handles skewed data

    Code
      x <- c(1:5, rep(10, 10))
      col <- col_quantile("RdYlBu", domain = x, n = 7)(x)
    Condition
      Warning:
      Skewed data means we can only allocate 4 unique colours not the 7 requested
    Code
      col <- col_quantile("RdYlBu", domain = NULL, n = 7)(x)
    Condition
      Warning:
      Skewed data means we can only allocate 4 unique colours not the 7 requested

