# Out of bounds handling

This set of functions modify data values outside a given range. The
`oob_*()` functions are designed to be passed as the `oob` argument of
ggplot2 continuous and binned scales, with `oob_discard` being an
exception.

These functions affect out of bounds values in the following ways:

- `oob_censor()` replaces out of bounds values with `NA`s. This is the
  default `oob` argument for continuous scales.

- `oob_censor_any()` acts like `oob_censor()`, but also replaces
  infinite values with `NA`s.

- `oob_squish()` replaces out of bounds values with the nearest limit.
  This is the default `oob` argument for binned scales.

- `oob_squish_any()` acts like `oob_squish()`, but also replaces
  infinite values with the nearest limit.

- `oob_squish_infinite()` only replaces infinite values by the nearest
  limit.

- `oob_keep()` does not adjust out of bounds values. In position scales,
  behaves as zooming limits without data removal.

- `oob_discard()` removes out of bounds values from the input. Not
  suitable for ggplot2 scales.

## Usage

``` r
oob_censor(x, range = c(0, 1), only.finite = TRUE)

oob_censor_any(x, range = c(0, 1))

oob_discard(x, range = c(0, 1))

oob_squish(x, range = c(0, 1), only.finite = TRUE)

oob_squish_any(x, range = c(0, 1))

oob_squish_infinite(x, range = c(0, 1))

oob_keep(x, range = c(0, 1))

censor(x, range = c(0, 1), only.finite = TRUE)

discard(x, range = c(0, 1))

squish(x, range = c(0, 1), only.finite = TRUE)

squish_infinite(x, range = c(0, 1))
```

## Arguments

- x:

  A numeric vector of values to modify.

- range:

  A numeric vector of length two giving the minimum and maximum limit of
  the desired output range respectively.

- only.finite:

  A logical of length one. When `TRUE`, only finite values are altered.
  When `FALSE`, also infinite values are altered.

## Value

Most `oob_()` functions return a vector of numerical values of the same
length as the `x` argument, wherein out of bounds values have been
modified. Only `oob_discard()` returns a vector of less than or of equal
length to the `x` argument.

## Details

The `oob_censor_any()` and `oob_squish_any()` functions are the same as
`oob_censor()` and `oob_squish()` with the `only.finite` argument set to
`FALSE`.

Replacing position values with `NA`s, as `oob_censor()` does, will
typically lead to removal of those datapoints in ggplot.

Setting ggplot coordinate limits is equivalent to using `oob_keep()` in
position scales.

## Old interface

`censor()`, `squish()`, `squish_infinite()` and `discard()` are no
longer recommended; please use `oob_censor()`, `oob_squish()`,
`oob_squish_infinite()` and `oob_discard()` instead.

## Author

`oob_squish()`: Homer Strong <homer.strong@gmail.com>

## Examples

``` r
# Censoring replaces out of bounds values with NAs
oob_censor(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#> [1] -Inf   NA  0.5  1.0   NA   NA  Inf
oob_censor_any(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#> [1]  NA  NA 0.5 1.0  NA  NA  NA

# Squishing replaces out of bounds values with the nearest range limit
oob_squish(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#> [1] -Inf  0.0  0.5  1.0  1.0   NA  Inf
oob_squish_any(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#> [1] 0.0 0.0 0.5 1.0 1.0  NA 1.0
oob_squish_infinite(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#> [1]  0.0 -1.0  0.5  1.0  2.0   NA  1.0

# Keeping does not alter values
oob_keep(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#> [1] -Inf -1.0  0.5  1.0  2.0   NA  Inf

# Discarding will remove out of bounds values
oob_discard(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#> [1] 0.5 1.0  NA
```
