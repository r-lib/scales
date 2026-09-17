# Train (update) a discrete scale

Train (update) a discrete scale

## Usage

``` r
train_discrete(
  new,
  existing = NULL,
  drop = FALSE,
  na.rm = FALSE,
  fct = NA,
  call = caller_env()
)
```

## Arguments

- new:

  New data to add to scale

- existing:

  Optional existing scale to update

- drop:

  `TRUE`, will drop factor levels not associated with data

- na.rm:

  If `TRUE`, will remove missing values

- fct:

  Treat `existing` as if it came from a factor (ie. don't sort the
  range)

- call:

  A call to display in error messages
