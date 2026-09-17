# Automatic breaks for numeric axes

Uses Wilkinson's extended breaks algorithm as implemented in the
labeling package.

## Usage

``` r
breaks_extended(n = 5, only_loose = FALSE, ...)
```

## Arguments

- n:

  Desired number of breaks. You may get slightly more or fewer breaks
  that requested.

- only_loose:

  if true, the extreme labels will be outside the data range

- ...:

  other arguments passed on to
  [`labeling::extended()`](https://rdrr.io/pkg/labeling/man/extended.html)

## Value

All `breaks_()` functions return a function for generating breaks. These
functions takes, as their first argument a vector of values that
represent the data range to provide breaks for. Some will optionally
take a second argument that allows you to specify the number of breaks
to recieve.

## References

Talbot, J., Lin, S., Hanrahan, P. (2010) An Extension of Wilkinson's
Algorithm for Positioning Tick Labels on Axes, InfoVis 2010
<http://vis.stanford.edu/files/2010-TickLabels-InfoVis.pdf>.

## Examples

``` r
library(ggplot2)
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  scale_x_continuous(breaks = breaks_extended(n = 10))

demo_continuous(c(0, 10))
#> scale_x_continuous()

demo_continuous(c(0, 10), breaks = breaks_extended(3))
#> scale_x_continuous(breaks = breaks_extended(3))

demo_continuous(c(0, 10), breaks = breaks_extended(10))
#> scale_x_continuous(breaks = breaks_extended(10))
```
