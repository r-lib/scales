# Label currencies (\$100, €2.50, etc)

Format numbers as currency, rounding values to monetary or fractional
monetary using unit a convenient heuristic.

## Usage

``` r
label_currency(
  accuracy = NULL,
  scale = 1,
  prefix = NULL,
  suffix = NULL,
  big.mark = NULL,
  decimal.mark = NULL,
  trim = TRUE,
  largest_with_fractional = 1e+05,
  ...
)
```

## Arguments

- accuracy, largest_with_fractional:

  Number to round to. If `NULL`, the default, values will be rounded to
  the nearest integer, unless any of the values has non-zero fractional
  component (e.g. cents) and the largest value is less than
  `largest_with_fractional` which by default is 100,000.

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

- ...:

  Arguments passed on to
  [`number`](https://scales.r-lib.org/dev/reference/number.md)

  `space`

  :   Add a space before the scale suffix?

  `unit`

  :   SI unit abbreviation.

  `style_positive`

  :   A string that determines the style of positive numbers:

      - `"none"` (the default): no change, e.g. `1`.

      - `"plus"`: preceded by `+`, e.g. `+1`.

      - `"space"`: preceded by a Unicode "figure space", i.e., a space
        equally as wide as a number or `+`. Compared to `"none"`, adding
        a figure space can ensure numbers remain properly aligned when
        they are left- or right-justified.

      The default (`NULL`) retrieves the setting from the [number
      options](https://scales.r-lib.org/dev/reference/number_options.md).

  `style_negative`

  :   A string that determines the style of negative numbers:

      - `"hyphen"` (the default): preceded by a standard hyphen `-`,
        e.g. `-1`.

      - `"minus"`, uses a proper Unicode minus symbol. This is a
        typographical nicety that ensures `-` aligns with the horizontal
        bar of the the horizontal bar of `+`.

      - `"parens"`, wrapped in parentheses, e.g. `(1)`.

      The default (`NULL`) retrieves the setting from the [number
      options](https://scales.r-lib.org/dev/reference/number_options.md).

  `scale_cut`

  :   Named numeric vector that allows you to rescale large (or small)
      numbers and add a prefix. Built-in helpers include:

      - [`cut_short_scale()`](https://scales.r-lib.org/dev/reference/number.md):
        \[10^3, 10^6) = K, \[10^6, 10^9) = M, \[10^9, 10^12) = B,
        \[10^12, Inf) = T.

      - [`cut_long_scale()`](https://scales.r-lib.org/dev/reference/number.md):
        \[10^3, 10^6) = K, \[10^6, 10^12) = M, \[10^12, 10^18) = B,
        \[10^18, Inf) = T.

      - `cut_si(unit)`: uses standard SI units.

      If you supply a vector `c(a = 100, b = 1000)`, absolute values in
      the range `[0, 100)` will not be rescaled, absolute values in the
      range `[100, 1000)` will be divided by 100 and given the suffix
      "a", and absolute values in the range `[1000, Inf)` will be
      divided by 1000 and given the suffix "b". If the division creates
      an irrational value (or one with many digits), the cut value below
      will be tried to see if it improves the look of the final label.

## Value

All `label_()` functions return a "labelling" function, i.e. a function
that takes a vector `x` and returns a character vector of `length(x)`
giving a label for each input value.

Labelling functions are designed to be used with the `labels` argument
of ggplot2 scales. The examples demonstrate their use with x scales, but
they work similarly for all scales, including those that generate
legends rather than axes.

## See also

Other labels for continuous scales:
[`label_bytes()`](https://scales.r-lib.org/dev/reference/label_bytes.md),
[`label_glue()`](https://scales.r-lib.org/dev/reference/label_glue.md),
[`label_number_auto()`](https://scales.r-lib.org/dev/reference/label_number_auto.md),
[`label_number_si()`](https://scales.r-lib.org/dev/reference/label_number_si.md),
[`label_ordinal()`](https://scales.r-lib.org/dev/reference/label_ordinal.md),
[`label_parse()`](https://scales.r-lib.org/dev/reference/label_parse.md),
[`label_percent()`](https://scales.r-lib.org/dev/reference/label_percent.md),
[`label_pvalue()`](https://scales.r-lib.org/dev/reference/label_pvalue.md),
[`label_scientific()`](https://scales.r-lib.org/dev/reference/label_scientific.md)

## Examples

``` r
demo_continuous(c(0, 1), labels = label_currency())
#> scale_x_continuous(labels = label_currency())

demo_continuous(c(1, 100), labels = label_currency())
#> scale_x_continuous(labels = label_currency())


# Customise currency display with prefix and suffix
demo_continuous(c(1, 100), labels = label_currency(prefix = "USD "))
#> scale_x_continuous(labels = label_currency(prefix = "USD "))

yen <- label_currency(
  prefix = "¥",
  suffix = "",
  big.mark = ".",
  decimal.mark = ","
)
demo_continuous(c(1000, 1100), labels = yen)
#> scale_x_continuous(labels = yen)


# Use style_negative = "parens" for finance style display
demo_continuous(c(-100, 100), labels = label_currency(style_negative = "parens"))
#> scale_x_continuous(labels = label_currency(style_negative = "parens"))


# Use scale_cut to use K/M/B where appropriate
demo_log10(c(1, 1e16),
  breaks = log_breaks(7, 1e3),
  labels = label_currency(scale_cut = cut_short_scale())
)
#> scale_x_log10(breaks = log_breaks(7, 1000), labels = label_currency(scale_cut = cut_short_scale()))

# cut_short_scale() uses B = one thousand million
# cut_long_scale() uses B = one million million
demo_log10(c(1, 1e16),
  breaks = log_breaks(7, 1e3),
  labels = label_currency(scale_cut = cut_long_scale())
)
#> scale_x_log10(breaks = log_breaks(7, 1000), labels = label_currency(scale_cut = cut_long_scale()))


# You can also define your own breaks
gbp <- label_currency(
  prefix = "\u00a3",
  scale_cut = c(0, k = 1e3, m = 1e6, bn = 1e9, tn = 1e12)
)
demo_log10(c(1, 1e12), breaks = log_breaks(5, 1e3), labels = gbp)
#> scale_x_log10(breaks = log_breaks(5, 1000), labels = gbp)
```
