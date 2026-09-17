# Rescale continuous vector to have specified minimum and maximum

Rescale continuous vector to have specified minimum and maximum

## Usage

``` r
rescale(x, to, from, ...)

# S3 method for class 'numeric'
rescale(x, to = c(0, 1), from = range(x, na.rm = TRUE, finite = TRUE), ...)

# S3 method for class 'dist'
rescale(x, to = c(0, 1), from = range(x, na.rm = TRUE, finite = TRUE), ...)

# S3 method for class 'logical'
rescale(x, to = c(0, 1), from = range(x, na.rm = TRUE, finite = TRUE), ...)

# S3 method for class 'POSIXt'
rescale(x, to = c(0, 1), from = range(x, na.rm = TRUE, finite = TRUE), ...)

# S3 method for class 'Date'
rescale(x, to = c(0, 1), from = range(x, na.rm = TRUE, finite = TRUE), ...)

# S3 method for class 'integer64'
rescale(x, to = c(0, 1), from = range(x, na.rm = TRUE), ...)

# S3 method for class 'difftime'
rescale(x, to = c(0, 1), from = range(x, na.rm = TRUE, finite = TRUE), ...)

# S3 method for class 'AsIs'
rescale(x, to, from, ...)
```

## Arguments

- x:

  continuous vector of values to manipulate.

- to:

  output range (numeric vector of length two)

- from:

  input range (vector of length two). If not given, is calculated from
  the range of `x`

- ...:

  other arguments passed on to methods

## Details

Objects of class `<AsIs>` are returned unaltered.

## Examples

``` r
rescale(1:100)
#>   [1] 0.00000000 0.01010101 0.02020202 0.03030303 0.04040404 0.05050505
#>   [7] 0.06060606 0.07070707 0.08080808 0.09090909 0.10101010 0.11111111
#>  [13] 0.12121212 0.13131313 0.14141414 0.15151515 0.16161616 0.17171717
#>  [19] 0.18181818 0.19191919 0.20202020 0.21212121 0.22222222 0.23232323
#>  [25] 0.24242424 0.25252525 0.26262626 0.27272727 0.28282828 0.29292929
#>  [31] 0.30303030 0.31313131 0.32323232 0.33333333 0.34343434 0.35353535
#>  [37] 0.36363636 0.37373737 0.38383838 0.39393939 0.40404040 0.41414141
#>  [43] 0.42424242 0.43434343 0.44444444 0.45454545 0.46464646 0.47474747
#>  [49] 0.48484848 0.49494949 0.50505051 0.51515152 0.52525253 0.53535354
#>  [55] 0.54545455 0.55555556 0.56565657 0.57575758 0.58585859 0.59595960
#>  [61] 0.60606061 0.61616162 0.62626263 0.63636364 0.64646465 0.65656566
#>  [67] 0.66666667 0.67676768 0.68686869 0.69696970 0.70707071 0.71717172
#>  [73] 0.72727273 0.73737374 0.74747475 0.75757576 0.76767677 0.77777778
#>  [79] 0.78787879 0.79797980 0.80808081 0.81818182 0.82828283 0.83838384
#>  [85] 0.84848485 0.85858586 0.86868687 0.87878788 0.88888889 0.89898990
#>  [91] 0.90909091 0.91919192 0.92929293 0.93939394 0.94949495 0.95959596
#>  [97] 0.96969697 0.97979798 0.98989899 1.00000000
rescale(runif(50))
#>  [1] 0.21001519 0.41290535 0.66712325 0.50351607 0.65848580 0.50771840
#>  [7] 0.83627250 0.70762450 0.87549823 0.00000000 0.88974976 0.99944738
#> [13] 0.49594687 0.35263170 0.77473537 0.58147836 0.63171229 0.85972839
#> [19] 0.56363718 0.24509291 0.92075572 0.86854100 0.24056859 0.39719599
#> [25] 0.76937432 0.10960476 0.18592775 0.15535605 0.66137523 0.85760628
#> [31] 0.92861359 0.54890553 0.57395911 0.68597526 0.23669156 0.03362819
#> [37] 0.91167459 0.06007810 1.00000000 0.60926082 0.16346393 0.91125487
#> [43] 0.02635611 0.59069130 0.22883630 0.90806463 0.81934612 0.69854017
#> [49] 0.21160774 0.72711865
rescale(1)
#> [1] 0.5
```
