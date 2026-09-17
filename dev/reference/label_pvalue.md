# Label p-values (e.g. \<0.001, 0.25, p \>= 0.99)

Formatter for p-values, using "\<" and "\>" for p-values close to 0 and
1.

## Usage

``` r
label_pvalue(
  accuracy = 0.001,
  decimal.mark = NULL,
  prefix = NULL,
  add_p = FALSE
)
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
[`label_scientific()`](https://scales.r-lib.org/dev/reference/label_scientific.md)

## Examples

``` r
demo_continuous(c(0, 1))
#> scale_x_continuous()

demo_continuous(c(0, 1), labels = label_pvalue())
#> scale_x_continuous(labels = label_pvalue())

demo_continuous(c(0, 1), labels = label_pvalue(accuracy = 0.1))
#> scale_x_continuous(labels = label_pvalue(accuracy = 0.1))

demo_continuous(c(0, 1), labels = label_pvalue(add_p = TRUE))
#> scale_x_continuous(labels = label_pvalue(add_p = TRUE))


# Or provide your own prefixes
prefix <- c("p < ", "p = ", "p > ")
demo_continuous(c(0, 1), labels = label_pvalue(prefix = prefix))
#> scale_x_continuous(labels = label_pvalue(prefix = prefix))
```
