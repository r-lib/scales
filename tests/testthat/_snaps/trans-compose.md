# produces informative errors

    Code
      compose_trans()
    Condition
      Error in `compose_trans()`:
      ! `compose_trans()` must include at least 1 transformer to compose
    Code
      compose_trans("reverse", "log10")
    Condition
      Error in `compose_trans()`:
      ! Sequence of transformations yields invalid domain

