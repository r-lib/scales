# Label with mathematical annotations

`label_parse()` produces expression from strings by parsing them;
`label_math()` constructs expressions by replacing the pronoun `.x` with
each string.

## Usage

``` r
label_parse()

label_math(expr = 10^.x, format = force)
```

## Arguments

- expr:

  expression to use

- format:

  another format function to apply prior to mathematical
  transformation - this makes it easier to use floating point numbers in
  mathematical expressions.

## Value

All `label_()` functions return a "labelling" function, i.e. a function
that takes a vector `x` and returns a character vector of `length(x)`
giving a label for each input value.

Labelling functions are designed to be used with the `labels` argument
of ggplot2 scales. The examples demonstrate their use with x scales, but
they work similarly for all scales, including those that generate
legends rather than axes.

## See also

[plotmath](https://rdrr.io/r/grDevices/plotmath.html) for the details of
mathematical formatting in R.

Other labels for continuous scales:
[`label_bytes()`](https://scales.r-lib.org/dev/reference/label_bytes.md),
[`label_currency()`](https://scales.r-lib.org/dev/reference/label_currency.md),
[`label_glue()`](https://scales.r-lib.org/dev/reference/label_glue.md),
[`label_number_auto()`](https://scales.r-lib.org/dev/reference/label_number_auto.md),
[`label_number_si()`](https://scales.r-lib.org/dev/reference/label_number_si.md),
[`label_ordinal()`](https://scales.r-lib.org/dev/reference/label_ordinal.md),
[`label_percent()`](https://scales.r-lib.org/dev/reference/label_percent.md),
[`label_pvalue()`](https://scales.r-lib.org/dev/reference/label_pvalue.md),
[`label_scientific()`](https://scales.r-lib.org/dev/reference/label_scientific.md)

Other labels for discrete scales:
[`label_dictionary()`](https://scales.r-lib.org/dev/reference/label_dictionary.md),
[`label_glue()`](https://scales.r-lib.org/dev/reference/label_glue.md),
[`label_wrap()`](https://scales.r-lib.org/dev/reference/label_wrap.md)

## Examples

``` r
library(ggplot2)
plants <- transform(
  PlantGrowth,
  group = factor(group, labels = c("ctrl", "trt[1]", "trt[2]"))
)
ggplot(plants, aes(x = group, y = weight)) +
  geom_boxplot() +
  scale_x_discrete(labels = label_parse())

# Use label_parse() with discrete scales
greek <- c("alpha", "beta", "gamma")
demo_discrete(greek)
#> scale_x_discrete()

demo_discrete(greek, labels = label_parse())
#> scale_x_discrete(labels = label_parse())


# Use label_math() with continuous scales
demo_continuous(c(1, 5))
#> scale_x_continuous()

demo_continuous(c(1, 5), labels = label_math(alpha[.x]))
#> scale_x_continuous(labels = label_math(alpha[.x]))

demo_continuous(c(1, 5), labels = label_math())
#> scale_x_continuous(labels = label_math())
```
