# as.trans generates informative error

    Code
      as.trans(1)
    Error <rlang_error>
      `1` must be a character vector or a transformer object
    Code
      as.trans("x")
    Error <simpleError>
      object 'x_trans' of mode 'function' was not found

