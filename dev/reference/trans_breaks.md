# Pretty breaks on transformed scale

**\[superseded\]**

These often do not produce very attractive breaks.

## Usage

``` r
trans_breaks(trans, inv, n = 5, ...)
```

## Arguments

- trans:

  function of single variable, `x`, that given a numeric vector returns
  the transformed values

- inv:

  inverse of the transformation function

- n:

  desired number of ticks

- ...:

  other arguments passed on to pretty

## Examples

``` r
trans_breaks("log10", function(x) 10^x)(c(1, 1e6))
#> [1] 1e+00 1e+01 1e+02 1e+03 1e+04 1e+05 1e+06
trans_breaks("sqrt", function(x) x^2)(c(1, 100))
#> [1]   0   4  16  36  64 100
trans_breaks(function(x) 1 / x, function(x) 1 / x)(c(1, 100))
#> [1]      Inf 5.000000 2.500000 1.666667 1.250000 1.000000
trans_breaks(function(x) -x, function(x) -x)(c(1, 100))
#> [1] 100  80  60  40  20   0
```
