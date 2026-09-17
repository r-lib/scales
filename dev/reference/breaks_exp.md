# Breaks for exponentially transformed data

This breaks function typically labels zero and the last `n - 1` integers
of a range if that range is large enough (currently: 3). For smaller
ranges, it uses
[`breaks_extended()`](https://scales.r-lib.org/dev/reference/breaks_extended.md).

## Usage

``` r
breaks_exp(n = 5, ...)
```

## Arguments

- n:

  Desired number of breaks. You may get slightly more or fewer breaks
  that requested.

- ...:

  other arguments passed on to
  [`labeling::extended()`](https://rdrr.io/pkg/labeling/man/extended.html)

## Value

All `breaks_()` functions return a function for generating breaks. These
functions takes, as their first argument a vector of values that
represent the data range to provide breaks for. Some will optionally
take a second argument that allows you to specify the number of breaks
to recieve.

## Examples

``` r
library(ggplot2)
ggplot(attenu, aes(x = mag, y = accel)) +
  geom_point() +
  scale_x_continuous(transform = "exp", breaks = breaks_exp())

# Small range
demo_continuous(c(100, 102), transform = "exp", breaks = breaks_exp())
#> scale_x_continuous(transform = "exp", breaks = breaks_exp())

# Large range
demo_continuous(c(0, 100), transform = "exp", breaks = breaks_exp(n = 4))
#> scale_x_continuous(transform = "exp", breaks = breaks_exp(n = 4))
```
