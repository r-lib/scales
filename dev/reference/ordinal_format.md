# Superseded interface to `label_ordinal()`

**\[superseded\]**

These functions are kept for backward compatibility; you should switch
to
[`label_ordinal()`](https://scales.r-lib.org/dev/reference/label_ordinal.md)
for new code.

## Usage

``` r
ordinal_format(prefix = "", suffix = "", big.mark = NULL, rules = NULL, ...)

ordinal(x, prefix = "", suffix = "", big.mark = " ", rules = NULL, ...)
```

## Arguments

- prefix, suffix:

  Symbols to display before and after value.

- big.mark:

  Character used between every 3 digits to separate thousands. The
  default (`NULL`) retrieves the setting from the [number
  options](https://scales.r-lib.org/dev/reference/number_options.md).

- rules:

  Named list of regular expressions, matched in order. Name gives
  suffix, and value specifies which numbers to match.

- ...:

  Other arguments passed on to
  [`base::format()`](https://rdrr.io/r/base/format.html).
