# Mute standard colour

Mute standard colour

## Usage

``` r
muted(colour, l = 30, c = 70)
```

## Arguments

- colour:

  character vector of colours to modify

- l:

  new luminance

- c:

  new chroma

## See also

Other colour manipulation:
[`alpha()`](https://scales.r-lib.org/dev/reference/alpha.md),
[`col2hcl()`](https://scales.r-lib.org/dev/reference/col2hcl.md),
[`col_mix()`](https://scales.r-lib.org/dev/reference/col_mix.md),
[`colour_manip`](https://scales.r-lib.org/dev/reference/colour_manip.md)

## Examples

``` r
muted("red")
#> [1] "#832424"
muted("blue")
#> [1] "#3A3A98"
show_col(c("red", "blue", muted("red"), muted("blue")))
```
