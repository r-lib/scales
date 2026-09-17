# Hue palette (discrete)

Hue palette (discrete)

## Usage

``` r
pal_hue(h = c(0, 360) + 15, c = 100, l = 65, h.start = 0, direction = 1)

hue_pal(h = c(0, 360) + 15, c = 100, l = 65, h.start = 0, direction = 1)
```

## Arguments

- h:

  range of hues to use, in \[0, 360\]

- c:

  chroma (intensity of colour), maximum value varies depending on
  combination of hue and luminance.

- l:

  luminance (lightness), in \[0, 100\]

- h.start:

  hue to start at

- direction:

  direction to travel around the colour wheel, 1 = clockwise, -1 =
  counter-clockwise

## Examples

``` r
show_col(pal_hue()(4))

show_col(pal_hue()(9))

show_col(pal_hue(l = 90)(9))

show_col(pal_hue(l = 30)(9))


show_col(pal_hue()(9))

show_col(pal_hue(direction = -1)(9))

show_col(pal_hue(h.start = 30)(9))

show_col(pal_hue(h.start = 90)(9))


show_col(pal_hue()(9))

show_col(pal_hue(h = c(0, 90))(9))

show_col(pal_hue(h = c(90, 180))(9))

show_col(pal_hue(h = c(180, 270))(9))

show_col(pal_hue(h = c(270, 360))(9))
```
