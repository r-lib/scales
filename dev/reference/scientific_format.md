# Superseded interface to `label_scientific()`

**\[superseded\]**

These functions are kept for backward compatibility; you should switch
to
[`label_scientific()`](https://scales.r-lib.org/dev/reference/label_scientific.md)
for new code.

## Usage

``` r
scientific_format(
  digits = 3,
  scale = 1,
  prefix = "",
  suffix = "",
  decimal.mark = NULL,
  trim = TRUE,
  ...
)

scientific(
  x,
  digits = 3,
  scale = 1,
  prefix = "",
  suffix = "",
  decimal.mark = NULL,
  trim = TRUE,
  ...
)
```

## Arguments

- digits:

  Number of digits to show before exponent.

- scale:

  A scaling factor: `x` will be multiplied by `scale` before formatting.
  This is useful if the underlying data is very small or very large.

- prefix, suffix:

  Symbols to display before and after value.

- decimal.mark:

  The character to be used to indicate the numeric decimal point. The
  default (`NULL`) retrieves the setting from the [number
  options](https://scales.r-lib.org/dev/reference/number_options.md).

- trim:

  Logical, if `FALSE`, values are right-justified to a common width (see
  [`base::format()`](https://rdrr.io/r/base/format.html)).

- ...:

  Other arguments passed on to
  [`base::format()`](https://rdrr.io/r/base/format.html).
