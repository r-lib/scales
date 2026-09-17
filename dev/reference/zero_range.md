# Determine if range of vector is close to zero, with a specified tolerance

The machine epsilon is the difference between 1.0 and the next number
that can be represented by the machine. By default, this function uses
epsilon \* 1000 as the tolerance. First it scales the values so that
they have a mean of 1, and then it checks if the difference between them
is larger than the tolerance.

## Usage

``` r
zero_range(x, tol = 1000 * .Machine$double.eps)
```

## Arguments

- x:

  numeric range: vector of length 2

- tol:

  A value specifying the tolerance.

## Value

logical `TRUE` if the relative difference of the endpoints of the range
are not distinguishable from 0.

## Examples

``` r
eps <- .Machine$double.eps
zero_range(c(1, 1 + eps))
#> [1] TRUE
zero_range(c(1, 1 + 99 * eps))
#> [1] TRUE
zero_range(c(1, 1 + 1001 * eps))
#> [1] FALSE
zero_range(c(1, 1 + 2 * eps), tol = eps)
#> [1] FALSE

# Scaling up or down all the values has no effect since the values
# are rescaled to 1 before checking against tol
zero_range(100000 * c(1, 1 + eps))
#> [1] TRUE
zero_range(100000 * c(1, 1 + 1001 * eps))
#> [1] FALSE
zero_range(.00001 * c(1, 1 + eps))
#> [1] TRUE
zero_range(.00001 * c(1, 1 + 1001 * eps))
#> [1] FALSE

# NA values
zero_range(c(1, NA)) # NA
#> [1] NA
zero_range(c(1, NaN)) # NA
#> [1] NA

# Infinite values
zero_range(c(1, Inf)) # FALSE
#> [1] FALSE
zero_range(c(-Inf, Inf)) # FALSE
#> [1] FALSE
zero_range(c(Inf, Inf)) # TRUE
#> [1] TRUE
```
