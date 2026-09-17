# Label numbers with scientific notation (e.g. 1e05, 1.5e-02)

Label numbers with scientific notation (e.g. 1e05, 1.5e-02)

## Usage

``` r
label_scientific(
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
[`label_currency()`](https://scales.r-lib.org/dev/reference/label_currency.md),
[`label_glue()`](https://scales.r-lib.org/dev/reference/label_glue.md),
[`label_number_auto()`](https://scales.r-lib.org/dev/reference/label_number_auto.md),
[`label_number_si()`](https://scales.r-lib.org/dev/reference/label_number_si.md),
[`label_ordinal()`](https://scales.r-lib.org/dev/reference/label_ordinal.md),
[`label_parse()`](https://scales.r-lib.org/dev/reference/label_parse.md),
[`label_percent()`](https://scales.r-lib.org/dev/reference/label_percent.md),
[`label_pvalue()`](https://scales.r-lib.org/dev/reference/label_pvalue.md)

Other labels for log scales:
[`label_bytes()`](https://scales.r-lib.org/dev/reference/label_bytes.md),
[`label_log()`](https://scales.r-lib.org/dev/reference/label_log.md),
[`label_number_si()`](https://scales.r-lib.org/dev/reference/label_number_si.md)

## Examples

``` r
demo_continuous(c(1, 10))
#> scale_x_continuous()

demo_continuous(c(1, 10), labels = label_scientific())
#> scale_x_continuous(labels = label_scientific())

demo_continuous(c(1, 10), labels = label_scientific(digits = 3))
#> scale_x_continuous(labels = label_scientific(digits = 3))


demo_log10(c(1, 1e9))
#> scale_x_log10()
```
