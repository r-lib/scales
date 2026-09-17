# Superseded interface to `label_pvalue()`

**\[superseded\]**

These functions are kept for backward compatibility; you should switch
to
[`label_pvalue()`](https://scales.r-lib.org/dev/reference/label_pvalue.md)
for new code.

## Usage

``` r
pvalue_format(
  accuracy = 0.001,
  decimal.mark = NULL,
  prefix = NULL,
  add_p = FALSE
)

pvalue(x, accuracy = 0.001, decimal.mark = NULL, prefix = NULL, add_p = FALSE)
```

## Arguments

- accuracy:

  A number to round to. Use (e.g.) `0.01` to show 2 decimal places of
  precision. If `NULL`, the default, uses a heuristic that should ensure
  breaks have the minimum number of digits needed to show the difference
  between adjacent values.

  Applied to rescaled data.

- decimal.mark:

  The character to be used to indicate the numeric decimal point. The
  default (`NULL`) retrieves the setting from the [number
  options](https://scales.r-lib.org/dev/reference/number_options.md).

- prefix:

  A character vector of length 3 giving the prefixes to put in front of
  numbers. The default values are `c("p<", "p=", "p>")` if `add_p` is
  `TRUE` and `c("<", "", ">")` if `FALSE`.

- add_p:

  Add "p=" before the value?
