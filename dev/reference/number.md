# A low-level numeric formatter

This function is a low-level helper that powers many of the labelling
functions. You should generally not need to call it directly unless you
are creating your own labelling function.

## Usage

``` r
number(
  x,
  accuracy = NULL,
  scale = 1,
  prefix = "",
  suffix = "",
  big.mark = NULL,
  decimal.mark = NULL,
  style_positive = NULL,
  style_negative = NULL,
  scale_cut = NULL,
  trim = TRUE,
  ...
)

cut_short_scale(space = FALSE)

cut_long_scale(space = FALSE)

cut_time_scale(space = FALSE)

cut_si(unit)
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

- style_positive:

  A string that determines the style of positive numbers:

  - `"none"` (the default): no change, e.g. `1`.

  - `"plus"`: preceded by `+`, e.g. `+1`.

  - `"space"`: preceded by a Unicode "figure space", i.e., a space
    equally as wide as a number or `+`. Compared to `"none"`, adding a
    figure space can ensure numbers remain properly aligned when they
    are left- or right-justified.

  The default (`NULL`) retrieves the setting from the [number
  options](https://scales.r-lib.org/dev/reference/number_options.md).

- style_negative:

  A string that determines the style of negative numbers:

  - `"hyphen"` (the default): preceded by a standard hyphen `-`, e.g.
    `-1`.

  - `"minus"`, uses a proper Unicode minus symbol. This is a
    typographical nicety that ensures `-` aligns with the horizontal bar
    of the the horizontal bar of `+`.

  - `"parens"`, wrapped in parentheses, e.g. `(1)`.

  The default (`NULL`) retrieves the setting from the [number
  options](https://scales.r-lib.org/dev/reference/number_options.md).

- scale_cut:

  Named numeric vector that allows you to rescale large (or small)
  numbers and add a prefix. Built-in helpers include:

  - `cut_short_scale()`: \[10^3, 10^6) = K, \[10^6, 10^9) = M, \[10^9,
    10^12) = B, \[10^12, Inf) = T.

  - `cut_long_scale()`: \[10^3, 10^6) = K, \[10^6, 10^12) = M, \[10^12,
    10^18) = B, \[10^18, Inf) = T.

  - `cut_si(unit)`: uses standard SI units.

  If you supply a vector `c(a = 100, b = 1000)`, absolute values in the
  range `[0, 100)` will not be rescaled, absolute values in the range
  `[100, 1000)` will be divided by 100 and given the suffix "a", and
  absolute values in the range `[1000, Inf)` will be divided by 1000 and
  given the suffix "b". If the division creates an irrational value (or
  one with many digits), the cut value below will be tried to see if it
  improves the look of the final label.

- trim:

  Logical, if `FALSE`, values are right-justified to a common width (see
  [`base::format()`](https://rdrr.io/r/base/format.html)).

- ...:

  Other arguments passed on to
  [`base::format()`](https://rdrr.io/r/base/format.html).

- space:

  Add a space before the scale suffix?

- unit:

  SI unit abbreviation.

## Value

A character vector of `length(x)`.
