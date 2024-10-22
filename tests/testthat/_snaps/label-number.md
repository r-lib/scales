# scale_cut checks its inputs

    Code
      number(1, scale_cut = 0)
    Condition
      Error in `scale_cut()`:
      ! `scale_cut` must have names
    Code
      number(1, scale_cut = "x")
    Condition
      Error in `scale_cut()`:
      ! `scale_cut` must be a numeric vector, not the string "x".
    Code
      number(1, scale_cut = c(x = 0, NA))
    Condition
      Error in `scale_cut()`:
      ! `scale_cut` values must not be missing

