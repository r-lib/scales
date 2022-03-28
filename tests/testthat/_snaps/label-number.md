# scale_cut checks its inputs

    Code
      number(1, scale_cut = 0)
    Condition
      Error in `scale_cut()`:
      ! `scale_cut` must be a named numeric vector
    Code
      number(1, scale_cut = "x")
    Condition
      Error in `scale_cut()`:
      ! `scale_cut` must be a named numeric vector
    Code
      number(1, scale_cut = c(x = 1, y = 2))
    Condition
      Error in `scale_cut()`:
      ! Smallest value of `scales_cut` must be zero
    Code
      number(1, scale_cut = c(x = 0, NA))
    Condition
      Error in `scale_cut()`:
      ! `scale_cut` values must not be missing

