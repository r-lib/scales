# Continuous scale

Continuous scale

## Usage

``` r
cscale(x, palette, na.value = NA_real_, trans = transform_identity())
```

## Arguments

- x:

  vector of continuous values to scale

- palette:

  palette to use.

  Built in palettes:
  [`pal_area`](https://scales.r-lib.org/dev/reference/pal_area.md),
  [`pal_brewer`](https://scales.r-lib.org/dev/reference/pal_brewer.md),
  [`pal_dichromat`](https://scales.r-lib.org/dev/reference/pal_dichromat.md),
  [`pal_div_gradient`](https://scales.r-lib.org/dev/reference/pal_div_gradient.md),
  [`pal_gradient_n`](https://scales.r-lib.org/dev/reference/pal_gradient_n.md),
  [`pal_grey`](https://scales.r-lib.org/dev/reference/pal_grey.md),
  [`pal_hue`](https://scales.r-lib.org/dev/reference/pal_hue.md),
  [`pal_identity`](https://scales.r-lib.org/dev/reference/pal_identity.md),
  [`pal_linetype`](https://scales.r-lib.org/dev/reference/pal_linetype.md),
  [`pal_manual`](https://scales.r-lib.org/dev/reference/pal_manual.md),
  [`pal_rescale`](https://scales.r-lib.org/dev/reference/pal_rescale.md),
  [`pal_seq_gradient`](https://scales.r-lib.org/dev/reference/pal_seq_gradient.md),
  [`pal_shape`](https://scales.r-lib.org/dev/reference/pal_shape.md),
  [`pal_viridis`](https://scales.r-lib.org/dev/reference/pal_viridis.md)

- na.value:

  value to use for missing values

- trans:

  transformation object describing the how to transform the raw data
  prior to scaling. Defaults to the identity transformation which leaves
  the data unchanged.

  Built in transformations:
  [`transform_asinh`](https://scales.r-lib.org/dev/reference/transform_asinh.md),
  [`transform_asn`](https://scales.r-lib.org/dev/reference/transform_asn.md),
  [`transform_atanh`](https://scales.r-lib.org/dev/reference/transform_atanh.md),
  [`transform_boxcox`](https://scales.r-lib.org/dev/reference/transform_boxcox.md),
  [`transform_compose`](https://scales.r-lib.org/dev/reference/transform_compose.md),
  [`transform_date`](https://scales.r-lib.org/dev/reference/transform_date.md),
  [`transform_exp`](https://scales.r-lib.org/dev/reference/transform_exp.md),
  [`transform_hms`](https://scales.r-lib.org/dev/reference/transform_timespan.md),
  [`transform_identity`](https://scales.r-lib.org/dev/reference/transform_identity.md),
  [`transform_log`](https://scales.r-lib.org/dev/reference/transform_log.md),
  [`transform_log10`](https://scales.r-lib.org/dev/reference/transform_log.md),
  [`transform_log1p`](https://scales.r-lib.org/dev/reference/transform_log.md),
  [`transform_log2`](https://scales.r-lib.org/dev/reference/transform_log.md),
  [`transform_logit`](https://scales.r-lib.org/dev/reference/transform_probability.md),
  [`transform_modulus`](https://scales.r-lib.org/dev/reference/transform_boxcox.md),
  [`transform_probability`](https://scales.r-lib.org/dev/reference/transform_probability.md),
  [`transform_probit`](https://scales.r-lib.org/dev/reference/transform_probability.md),
  [`transform_pseudo_log`](https://scales.r-lib.org/dev/reference/transform_log.md),
  [`transform_reciprocal`](https://scales.r-lib.org/dev/reference/transform_reciprocal.md),
  [`transform_reverse`](https://scales.r-lib.org/dev/reference/transform_reverse.md),
  [`transform_sqrt`](https://scales.r-lib.org/dev/reference/transform_sqrt.md),
  [`transform_time`](https://scales.r-lib.org/dev/reference/transform_time.md),
  [`transform_timespan`](https://scales.r-lib.org/dev/reference/transform_timespan.md),
  [`transform_yj`](https://scales.r-lib.org/dev/reference/transform_yj.md)
  .

## Examples

``` r
with(mtcars, plot(disp, mpg, cex = cscale(hp, pal_rescale())))

with(mtcars, plot(disp, mpg, cex = cscale(hp, pal_rescale(),
  trans = transform_sqrt()
)))

with(mtcars, plot(disp, mpg, cex = cscale(hp, pal_area())))

with(mtcars, plot(disp, mpg,
  pch = 20, cex = 5,
  col = cscale(hp, pal_seq_gradient("grey80", "black"))
))
```
