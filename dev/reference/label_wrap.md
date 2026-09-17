# Label strings by wrapping across multiple lines

Uses [`strwrap()`](https://rdrr.io/r/base/strwrap.html) to split long
labels across multiple lines.

## Usage

``` r
label_wrap(width)
```

## Arguments

- width:

  Number of characters per line.

## Value

All `label_()` functions return a "labelling" function, i.e. a function
that takes a vector `x` and returns a character vector of `length(x)`
giving a label for each input value.

Labelling functions are designed to be used with the `labels` argument
of ggplot2 scales. The examples demonstrate their use with x scales, but
they work similarly for all scales, including those that generate
legends rather than axes.

## See also

Other labels for discrete scales:
[`label_dictionary()`](https://scales.r-lib.org/dev/reference/label_dictionary.md),
[`label_glue()`](https://scales.r-lib.org/dev/reference/label_glue.md),
[`label_parse()`](https://scales.r-lib.org/dev/reference/label_parse.md)

## Examples

``` r
library(ggplot2)
animals <- head(msleep[c("name", "sleep_total")], 8)
ggplot(animals, aes(x = name, y = sleep_total)) +
  geom_col() +
  scale_x_discrete(labels = label_wrap(10))

x <- c(
  "this is a long label",
  "this is another long label",
  "this a label this is even longer"
)
demo_discrete(x)
#> scale_x_discrete()

demo_discrete(x, labels = label_wrap(10))
#> scale_x_discrete(labels = label_wrap(10))

demo_discrete(x, labels = label_wrap(20))
#> scale_x_discrete(labels = label_wrap(20))
```
