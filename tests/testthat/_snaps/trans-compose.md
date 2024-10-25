# produces informative errors

    Code
      transform_compose()
    Condition
      Error in `transform_compose()`:
      ! `transform_compose()` must include at least 1 transformer to compose
    Code
      transform_compose("sqrt", "reverse", "log10")
    Condition
      Error in `transform_compose()`:
      ! Sequence of transformations yields invalid domain

# produces correct domains

    Code
      transform_compose("sqrt", "reverse", "log")$domain
    Condition
      Error in `transform_compose()`:
      ! Sequence of transformations yields invalid domain

