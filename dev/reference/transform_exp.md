# Exponential transformation (inverse of log transformation)

Exponential transformation (inverse of log transformation)

## Usage

``` r
transform_exp(base = exp(1))

exp_trans(base = exp(1))
```

## Arguments

- base:

  Base of logarithm

## Examples

``` r
plot(transform_exp(0.5), xlim = c(-2, 2))

plot(transform_exp(1), xlim = c(-2, 2))

plot(transform_exp(2), xlim = c(-2, 2))

plot(transform_exp(), xlim = c(-2, 2))
```
