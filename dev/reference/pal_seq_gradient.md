# Sequential colour gradient palette (continuous)

Sequential colour gradient palette (continuous)

## Usage

``` r
pal_seq_gradient(low = "#2B6788", high = "#90503F", space = "Lab")

seq_gradient_pal(low = "#2B6788", high = "#90503F", space = "Lab")
```

## Arguments

- low:

  colour for low end of gradient.

- high:

  colour for high end of gradient.

- space:

  colour space in which to calculate gradient. Must be "Lab" - other
  values are deprecated.

## Examples

``` r
x <- seq(0, 1, length.out = 25)
show_col(pal_seq_gradient()(x))

show_col(pal_seq_gradient("white", "black")(x))


show_col(pal_seq_gradient("white", "#90503F")(x))
```
