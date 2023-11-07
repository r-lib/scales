# as.transform generates informative error

    Code
      as.transform(1)
    Condition
      Error in `as.transform()`:
      ! `1` must be a character vector or a transformer object
    Code
      as.transform("x")
    Condition
      Error in `get()`:
      ! object 'transform_x' of mode 'function' was not found

# trans has useful print method

    Code
      new_transform("test", transform = identity, inverse = identity)
    Output
      Transformer: test [-Inf, Inf]

