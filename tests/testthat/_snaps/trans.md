# as.trans generates informative error

    Code
      as.trans(1)
    Condition
      Error in `as.trans()`:
      ! `1` must be a character vector or a transformer object
    Code
      as.trans("x")
    Condition
      Error in `get()`:
      ! object 'x_trans' of mode 'function' was not found

# trans has useful print method

    Code
      trans_new("test", transform = identity, inverse = identity)
    Output
      Transformer: test [-Inf, Inf]

