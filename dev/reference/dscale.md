# Discrete scale

Discrete scale

## Usage

``` r
dscale(x, palette, na.value = NA)
```

## Arguments

- x:

  vector of discrete values to scale

- palette:

  aesthetic palette to use

- na.value:

  aesthetic to use for missing values

## Examples

``` r
with(mtcars, plot(disp, mpg,
  pch = 20, cex = 3,
  col = dscale(factor(cyl), pal_brewer())
))
```
