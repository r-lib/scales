# Log transformations

- `transform_log()`: `log(x)`

- [`log1p()`](https://rdrr.io/r/base/Log.html): `log(x + 1)`

- `transform_pseudo_log()`: smoothly transition to linear scale around
  0.

## Usage

``` r
transform_log(base = exp(1))

transform_log10()

transform_log2()

transform_log1p()

log_trans(base = exp(1))

log10_trans()

log2_trans()

log1p_trans()

transform_pseudo_log(sigma = 1, base = exp(1))

pseudo_log_trans(sigma = 1, base = exp(1))
```

## Arguments

- base:

  base of logarithm

- sigma:

  Scaling factor for the linear part of pseudo-log transformation.

## Examples

``` r
plot(transform_log2(), xlim = c(0, 5))

plot(transform_log(), xlim = c(0, 5))

plot(transform_log10(), xlim = c(0, 5))


plot(transform_log(), xlim = c(0, 2))

plot(transform_log1p(), xlim = c(-1, 1))


# The pseudo-log is defined for all real numbers
plot(transform_pseudo_log(), xlim = c(-5, 5))
lines(transform_log(), xlim = c(0, 5), col = "red")


# For large positives numbers it's very close to log
plot(transform_pseudo_log(), xlim = c(1, 20))
lines(transform_log(), xlim = c(1, 20), col = "red")
```
