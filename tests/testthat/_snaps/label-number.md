# scale_cut checks its inputs

    Code
      number(1, scale_cut = 1)
    Condition
      Error in `scale_cut()`:
      ! `scale_cut` must be a named numeric vector
    Code
      number(1, scale_cut = "x")
    Condition
      Error in `scale_cut()`:
      ! `scale_cut` must be a named numeric vector
    Code
      number(1, scale_cut = c(x = 0, y = 1))
    Condition
      Error in `scale_cut()`:
      ! `scale_cut` values must be non-missing and greater than zero

