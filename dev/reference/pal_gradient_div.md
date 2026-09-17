# Diverging colour gradient (continuous).

Diverging colour gradient (continuous).

## Usage

``` r
pal_gradient_div(
  low = "#2B6788",
  mid = "#CBCBCB",
  high = "#90503F",
  space = "Lab"
)

div_gradient_pal(
  low = "#2B6788",
  mid = "#CBCBCB",
  high = "#90503F",
  space = "Lab"
)

pal_div_gradient(
  low = "#2B6788",
  mid = "#CBCBCB",
  high = "#90503F",
  space = "Lab"
)
```

## Arguments

- low:

  colour for low end of gradient.

- mid:

  colour for mid point

- high:

  colour for high end of gradient.

- space:

  colour space in which to calculate gradient. Must be "Lab" - other
  values are deprecated.

## Examples

``` r
x <- seq(-1, 1, length.out = 100)
r <- sqrt(outer(x^2, x^2, "+"))
image(r, col = pal_div_gradient()(seq(0, 1, length.out = 12)))

image(r, col = pal_div_gradient()(seq(0, 1, length.out = 30)))

image(r, col = pal_div_gradient()(seq(0, 1, length.out = 100)))


pal <- pal_div_gradient(low = "#2E6A70")
image(r, col = pal(seq(0, 1, length.out = 100)))
```
