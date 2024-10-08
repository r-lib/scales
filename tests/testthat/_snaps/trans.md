# as.transform generates informative error

    Code
      as.transform(1)
    Condition
      Error in `as.transform()`:
      ! `x` must be a character vector or transform object, not the number 1.
    Code
      as.transform("x")
    Condition
      Error in `as.transform()`:
      ! Could not find any function named `transform_x()` or `x_trans()`

# trans has useful print method

    Code
      new_transform("test", transform = identity, inverse = identity)
    Output
      Transformer: test [-Inf, Inf]

