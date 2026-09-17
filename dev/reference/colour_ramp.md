# Fast colour interpolation

Returns a function that maps the interval \[0,1\] to a set of colours.
Interpolation is performed in the CIELAB colour space. Similar to
[`colorRamp`](https://rdrr.io/r/grDevices/colorRamp.html)`(space = 'Lab')`,
but hundreds of times faster, and provides results in `"#RRGGBB"` (or
`"#RRGGBBAA"`) character form instead of RGB colour matrices.

## Usage

``` r
colour_ramp(colors, na.color = NA, alpha = TRUE)
```

## Arguments

- colors:

  Colours to interpolate; must be a valid argument to
  [`grDevices::col2rgb()`](https://rdrr.io/r/grDevices/col2rgb.html).
  This can be a character vector of `"#RRGGBB"` or `"#RRGGBBAA"`, colour
  names from
  [`grDevices::colors()`](https://rdrr.io/r/grDevices/colors.html), or a
  positive integer that indexes into
  [`grDevices::palette()`](https://rdrr.io/r/grDevices/palette.html).

- na.color:

  The colour to map to `NA` values (for example, `"#606060"` for dark
  grey, or `"#00000000"` for transparent) and values outside of \[0,1\].
  Can itself by `NA`, which will simply cause an `NA` to be inserted
  into the output.

- alpha:

  Whether to include alpha transparency channels in interpolation. If
  `TRUE` then the alpha information is included in the interpolation.
  The returned colours will be provided in `"#RRGGBBAA"` format when
  needed, i.e., in cases where the colour is not fully opaque, so that
  the `"AA"` part is not equal to `"FF"`. Fully opaque colours will be
  returned in `"#RRGGBB"` format. If `FALSE`, the alpha information is
  discarded before interpolation and colours are always returned as
  `"#RRGGBB"`.

## Value

A function that takes a numeric vector and returns a character vector of
the same length with RGB or RGBA hex colours.

## See also

[`colorRamp`](https://rdrr.io/r/grDevices/colorRamp.html)

## Examples

``` r
ramp <- colour_ramp(c("red", "green", "blue"))
show_col(ramp(seq(0, 1, length = 12)))
```
