# Mix colours

Produces an interpolation of two colours.

## Usage

``` r
col_mix(a, b, amount = 0.5, space = "rgb")
```

## Arguments

- a:

  Either a character vector of colours or a colour palette function.

- b:

  A character vector of colours.

- amount:

  A numeric fraction between 0 and 1 giving the contribution of the `b`
  colour.

- space:

  A string giving a colour space to perform mixing operation in. Polar
  spaces are not recommended.

## Value

A character vector of colours.

## See also

Other colour manipulation:
[`alpha()`](https://scales.r-lib.org/dev/reference/alpha.md),
[`col2hcl()`](https://scales.r-lib.org/dev/reference/col2hcl.md),
[`colour_manip`](https://scales.r-lib.org/dev/reference/colour_manip.md),
[`muted()`](https://scales.r-lib.org/dev/reference/muted.md)

## Examples

``` r
col_mix("blue", "red") # purple
#> [1] "#800080FF"
col_mix("blue", "red", amount = 1) # red
#> [1] "#FF0000FF"
col_mix("blue", "red", amount = 0) # blue
#> [1] "#0000FFFF"

# Not recommended:
col_mix("blue", "red", space = "hcl") # green!
#> [1] "#008800FF"
```
