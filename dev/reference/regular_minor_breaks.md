# Minor breaks

Places minor breaks between major breaks.

## Usage

``` r
regular_minor_breaks(reverse = FALSE)
```

## Arguments

- reverse:

  if TRUE, calculates the minor breaks for a reversed scale

## Examples

``` r
m <- extended_breaks()(c(1, 10))
regular_minor_breaks()(m, c(1, 10), n = 2)
#> [1]  0.00  1.25  2.50  3.75  5.00  6.25  7.50  8.75 10.00

n <- extended_breaks()(c(0, -9))
regular_minor_breaks(reverse = TRUE)(n, c(0, -9), n = 2)
#> [1] -10.00  -8.75  -7.50  -6.25  -5.00  -3.75  -2.50  -1.25   0.00
```
