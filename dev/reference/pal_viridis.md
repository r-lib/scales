# Viridis palette

Viridis palette

## Usage

``` r
pal_viridis(alpha = 1, begin = 0, end = 1, direction = 1, option = "D")

viridis_pal(alpha = 1, begin = 0, end = 1, direction = 1, option = "D")
```

## Arguments

- alpha:

  The alpha transparency, a number in \[0,1\], see argument alpha in
  [`hsv`](https://rdrr.io/r/grDevices/hsv.html).

- begin, end:

  The (corrected) hue in `[0,1]` at which the color map begins and ends.

- direction:

  Sets the order of colors in the scale. If 1, the default, colors are
  ordered from darkest to lightest. If -1, the order of colors is
  reversed.

- option:

  A character string indicating the color map option to use. Eight
  options are available:

  - `"magma"` (or `"A"`)

  - `"inferno"` (or `"B"`)

  - `"plasma"` (or `"C"`)

  - `"viridis"` (or `"D"`)

  - `"cividis"` (or `"E"`)

  - `"rocket"` (or `"F"`)

  - `"mako"` (or `"G"`)

  - `"turbo"` (or `"H"`)

## References

<https://bids.github.io/colormap/>

## Examples

``` r
show_col(pal_viridis()(10))

show_col(pal_viridis(direction = -1)(6))

show_col(pal_viridis(begin = 0.2, end = 0.8)(4))

show_col(pal_viridis(option = "plasma")(6))
```
