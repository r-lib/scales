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

