# Colour Brewer palette (discrete)

Colour Brewer palette (discrete)

## Usage

``` r
pal_brewer(type = "seq", palette = 1, direction = 1)

brewer_pal(type = "seq", palette = 1, direction = 1)
```

## Arguments

- type:

  One of "seq" (sequential), "div" (diverging) or "qual" (qualitative)

- palette:

  If a string, will use that named palette. If a number, will index into
  the list of palettes of appropriate `type`

- direction:

  Sets the order of colours in the scale. If 1, the default, colours are
  as output by
  [`RColorBrewer::brewer.pal()`](https://rdrr.io/pkg/RColorBrewer/man/ColorBrewer.html).
  If -1, the order of colours is reversed.

## References

<https://colorbrewer2.org>

## Examples

``` r
show_col(pal_brewer()(10))
#> Warning: n too large, allowed maximum for palette Blues is 9
#> Returning the palette you asked for with that many colors

show_col(pal_brewer("div")(5))

show_col(pal_brewer(palette = "Greens")(5))


# Can use with gradient_n to create a continuous gradient
cols <- pal_brewer("div")(5)
show_col(pal_gradient_n(cols)(seq(0, 1, length.out = 30)))
```
