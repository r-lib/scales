# Arbitrary colour gradient palette (continuous)

Arbitrary colour gradient palette (continuous)

## Usage

``` r
pal_gradient_n(colours, values = NULL, space = "Lab")

gradient_n_pal(colours, values = NULL, space = "Lab")
```

## Arguments

- colours:

  vector of colours

- values:

  if colours should not be evenly positioned along the gradient this
  vector gives the position (between 0 and 1) for each colour in the
  `colours` vector. See
  [`rescale()`](https://scales.r-lib.org/dev/reference/rescale.md) for a
  convenience function to map an arbitrary range to between 0 and 1.

- space:

  colour space in which to calculate gradient. Must be "Lab" - other
  values are deprecated.
