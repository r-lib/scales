# Rescale palette (continuous)

Just rescales the input to the specific output range. Useful for alpha,
size, and continuous position.

## Usage

``` r
pal_rescale(range = c(0.1, 1))

rescale_pal(range = c(0.1, 1))
```

## Arguments

- range:

  Numeric vector of length two, giving range of possible values. Should
  be between 0 and 1.
