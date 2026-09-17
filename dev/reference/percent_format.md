# Superseded interface to `label_percent()`

**\[superseded\]**

These functions are kept for backward compatibility; you should switch
to
[`label_percent()`](https://scales.r-lib.org/dev/reference/label_percent.md)
for new code.

## Usage

``` r
percent_format(
  accuracy = NULL,
  scale = 100,
  prefix = "",
  suffix = "%",
  big.mark = NULL,
  decimal.mark = NULL,
  trim = TRUE,
  ...
)

percent(
  x,
  accuracy = NULL,
  scale = 100,
  prefix = "",
  suffix = "%",
  big.mark = NULL,
  decimal.mark = NULL,
  trim = TRUE,
  ...
)
```

## Arguments

- accuracy:

  A number to round to. Use (e.g.) `0.01` to show 2 decimal places of
  precision. If `NULL`, the default, uses a heuristic that should ensure
  breaks have the minimum number of digits needed to show the difference
  between adjacent values.

  Applied to rescaled data.

- scale:

  A scaling factor: `x` will be multiplied by `scale` before formatting.
  This is useful if the underlying data is very small or very large.

- prefix:

  Additional text to display before the number. The suffix is applied to
  absolute value before `style_positive` and `style_negative` are
  processed so that `prefix = "$"` will yield (e.g.) `-$1` and `($1)`.

- suffix:

  Additional text to display after the number.

- big.mark:

  Character used between every 3 digits to separate thousands. The
  default (`NULL`) retrieves the setting from the [number
  options](https://scales.r-lib.org/dev/reference/number_options.md).

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
