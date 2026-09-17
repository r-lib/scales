# Superseded interface to `label_currency()`

**\[superseded\]**

These functions are kept for backward compatibility; you should switch
to
[`label_currency()`](https://scales.r-lib.org/dev/reference/label_currency.md)
for new code.

## Usage

``` r
dollar_format(
  accuracy = NULL,
  scale = 1,
  prefix = "$",
  suffix = "",
  big.mark = ",",
  decimal.mark = ".",
  trim = TRUE,
  largest_with_cents = 1e+05,
  negative_parens = deprecated(),
  ...
)

dollar(
  x,
  accuracy = NULL,
  scale = 1,
  prefix = NULL,
  suffix = NULL,
  big.mark = NULL,
  decimal.mark = NULL,
  trim = TRUE,
  largest_with_cents = 1e+05,
  negative_parens = deprecated(),
  style_negative = c("hyphen", "minus", "parens"),
  scale_cut = NULL,
  ...
)

label_dollar(
  accuracy = NULL,
  scale = 1,
  prefix = "$",
  suffix = "",
  big.mark = ",",
  decimal.mark = ".",
  trim = TRUE,
  largest_with_cents = 1e+05,
  negative_parens = deprecated(),
  ...
)
```

## Arguments

- scale:

  A scaling factor: `x` will be multiplied by `scale` before formatting.
  This is useful if the underlying data is very small or very large.

- prefix, suffix:

  Symbols to display before and after value.

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

- largest_with_cents:

  Like `largest_with_fractional()` in
  [`label_currency()`](https://scales.r-lib.org/dev/reference/label_currency.md)

- negative_parens:

  **\[deprecated\]** Use `style_negative = "parens"` instead.

- ...:

  Other arguments passed on to
  [`base::format()`](https://rdrr.io/r/base/format.html).

- x:

  A numeric vector
