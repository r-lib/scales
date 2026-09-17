# Colour manipulation

These are a set of convenience functions for standard colour
manipulation operations.

## Usage

``` r
col_shift(col, amount = 10)

col_lighter(col, amount = 10)

col_darker(col, amount = 10)

col_saturate(col, amount = 10)
```

## Arguments

- col:

  A character vector of colours or a colour palette function.

- amount:

  A numeric vector giving the change. The interpretation depends on the
  function:

  - `col_shift()` takes a number between -360 and 360 for shifting hues
    in HCL space.

  - `col_lighter()` and `col_darker()` take a number between -100 and
    100 for adding (or subtracting) to the lightness channel in HSL
    space.

  - `col_saturate()` takes a number between -100 and 100 for adding to
    the saturation channel in HSL space. Negative numbers desaturate the
    colour.

## Value

A vector of colours.

## Details

`col_shift()` considers the hue channel to be periodic, so adding 180 to
a colour with hue 270 will result in a colour with hue 90.

## See also

Other colour manipulation:
[`alpha()`](https://scales.r-lib.org/dev/reference/alpha.md),
[`col2hcl()`](https://scales.r-lib.org/dev/reference/col2hcl.md),
[`col_mix()`](https://scales.r-lib.org/dev/reference/col_mix.md),
[`muted()`](https://scales.r-lib.org/dev/reference/muted.md)

## Examples

``` r
col_shift("red", 180) # teal
#> [1] "#00B8B8FF"
col_lighter("red", 50) # light red
#> [1] "#FFFFFF"
col_darker("red", 50) # dark red
#> [1] "#000000"
col_saturate("red", -50) # brick-red
#> [1] "#BF4040"
```
