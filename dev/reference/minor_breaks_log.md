# Minor breaks for log-10 axes

This break function is designed to mark every power, multiples of 5
and/or 1 of that power for base 10.

## Usage

``` r
minor_breaks_log(detail = NULL, smallest = NULL)
```

## Arguments

- detail:

  Any of `1`, `5` and `10` to mark multiples of powers, multiples of 5
  of powers or just powers respectively.

- smallest:

  Smallest absolute value to mark when the range includes negative
  numbers.

## Value

A function to generate minor ticks.

## Examples

``` r
library(ggplot2)
ggplot(msleep, aes(x = bodywt, y = sleep_total)) +
  geom_point() +
  scale_x_log10(minor_breaks = minor_breaks_log())

# Standard usage with log10 scale
demo_log10(c(1, 1e10), minor_breaks = minor_breaks_log())
#> scale_x_log10(minor_breaks = minor_breaks_log())

# Increasing detail over many powers
demo_log10(c(1, 1e10), minor_breaks = minor_breaks_log(detail = 1))
#> scale_x_log10(minor_breaks = minor_breaks_log(detail = 1))

# Adjusting until where to draw minor breaks
demo_continuous(
  c(-1000, 1000),
  transform = asinh_trans(),
  minor_breaks = minor_breaks_log(smallest = 1)
)
#> scale_x_continuous(transform = asinh_trans(), minor_breaks = minor_breaks_log(smallest = 1))
```
