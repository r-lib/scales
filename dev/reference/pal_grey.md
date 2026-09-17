# Grey scale palette (discrete)

Grey scale palette (discrete)

## Usage

``` r
pal_grey(start = 0.2, end = 0.8)

grey_pal(start = 0.2, end = 0.8)
```

## Arguments

- start:

  grey value at low end of palette

- end:

  grey value at high end of palette

## See also

[`pal_seq_gradient()`](https://scales.r-lib.org/dev/reference/pal_gradient_seq.md)
for continuous version

## Examples

``` r
show_col(pal_grey()(25))

show_col(pal_grey(0, 1)(25))
```
