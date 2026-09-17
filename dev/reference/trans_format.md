# Format labels after transformation

**\[superseded\]**

## Usage

``` r
trans_format(trans, format = scientific_format())
```

## Arguments

- trans:

  transformation to apply

- format:

  additional formatter to apply after transformation

## Value

a function with single parameter x, a numeric vector, that returns a
character vector of list of expressions

## Examples

``` r
tf <- trans_format("log10", scientific_format())
tf(10^1:6)
#> [1] "1.00e+00" "9.54e-01" "9.03e-01" "8.45e-01" "7.78e-01"
```
