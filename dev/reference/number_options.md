# Number options

Control the settings for formatting numbers globally.

## Usage

``` r
number_options(
  decimal.mark = ".",
  big.mark = " ",
  style_positive = c("none", "plus", "space"),
  style_negative = c("hyphen", "minus", "parens"),
  currency.prefix = "$",
  currency.suffix = "",
  currency.decimal.mark = decimal.mark,
  currency.big.mark = setdiff(c(".", ","), currency.decimal.mark)[1],
  ordinal.rules = ordinal_english()
)
```

## Arguments

- decimal.mark:

  The character to be used to indicate the numeric decimal point. The
  default (`NULL`) retrieves the setting from the number options.

- big.mark:

  Character used between every 3 digits to separate thousands. The
  default (`NULL`) retrieves the setting from the number options.

- style_positive:

  A string that determines the style of positive numbers:

  - `"none"` (the default): no change, e.g. `1`.

  - `"plus"`: preceded by `+`, e.g. `+1`.

  - `"space"`: preceded by a Unicode "figure space", i.e., a space
    equally as wide as a number or `+`. Compared to `"none"`, adding a
    figure space can ensure numbers remain properly aligned when they
    are left- or right-justified.

  The default (`NULL`) retrieves the setting from the number options.

- style_negative:

  A string that determines the style of negative numbers:

  - `"hyphen"` (the default): preceded by a standard hyphen `-`, e.g.
    `-1`.

  - `"minus"`, uses a proper Unicode minus symbol. This is a
    typographical nicety that ensures `-` aligns with the horizontal bar
    of the the horizontal bar of `+`.

  - `"parens"`, wrapped in parentheses, e.g. `(1)`.

  The default (`NULL`) retrieves the setting from the number options.

- currency.prefix, currency.suffix, currency.decimal.mark,
  currency.big.mark:

  Settings for
  [`label_currency()`](https://scales.r-lib.org/dev/reference/label_currency.md)
  passed on without the `currency.`-prefix.

- ordinal.rules:

  Setting for
  [`label_ordinal()`](https://scales.r-lib.org/dev/reference/label_ordinal.md)
  passed on without the `ordinal.`-prefix.

## Value

The old options invisibly

## Examples

``` r
# Default number formatting
x <- c(0.1, 1, 1000)
label_number()(x)
#> [1] "0.1"     "1.0"     "1 000.0"

# Now again with new options set
number_options(style_positive = "plus", decimal.mark = ",")
label_number()(x)
#> [1] "+0,1"     "+1,0"     "+1 000,0"

# The options are the argument names with a 'scales.'-prefix
options("scales.style_positive")
#> $scales.style_positive
#> [1] "plus"
#> 

# Resetting the options to their defaults
number_options()
label_number()(x)
#> [1] "0.1"     "1.0"     "1 000.0"
```
