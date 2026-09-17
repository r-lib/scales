# Label numbers, avoiding scientific notation where possible

Switches between
[`number_format()`](https://scales.r-lib.org/dev/reference/comma.md) and
[`scientific_format()`](https://scales.r-lib.org/dev/reference/scientific_format.md)
based on a set of heuristics designed to automatically generate useful
labels across a wide range of inputs

## Usage

``` r
label_number_auto()
```

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
[`label_number_si()`](https://scales.r-lib.org/dev/reference/label_number_si.md),
[`label_ordinal()`](https://scales.r-lib.org/dev/reference/label_ordinal.md),
[`label_parse()`](https://scales.r-lib.org/dev/reference/label_parse.md),
[`label_percent()`](https://scales.r-lib.org/dev/reference/label_percent.md),
[`label_pvalue()`](https://scales.r-lib.org/dev/reference/label_pvalue.md),
[`label_scientific()`](https://scales.r-lib.org/dev/reference/label_scientific.md)

## Examples

``` r
# Very small and very large numbers get scientific notation
demo_continuous(c(0, 1e-6), labels = label_number_auto())
#> scale_x_continuous(labels = label_number_auto())

demo_continuous(c(0, 1e9), labels = label_number_auto())
#> scale_x_continuous(labels = label_number_auto())


# Other ranges get the numbers printed in full
demo_continuous(c(0, 1e-3), labels = label_number_auto())
#> scale_x_continuous(labels = label_number_auto())

demo_continuous(c(0, 1), labels = label_number_auto())
#> scale_x_continuous(labels = label_number_auto())

demo_continuous(c(0, 1e3), labels = label_number_auto())
#> scale_x_continuous(labels = label_number_auto())

demo_continuous(c(0, 1e6), labels = label_number_auto())
#> scale_x_continuous(labels = label_number_auto())


# Transformation is applied individually so you get as little
# scientific notation as possible
demo_log10(c(1, 1e7), labels = label_number_auto())
#> scale_x_log10(labels = label_number_auto())
```
