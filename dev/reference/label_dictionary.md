# Labels from lookup tables

Use `label_dictionary()` for looking up succinct breaks in a named
character vector giving complete labels.

## Usage

``` r
label_dictionary(dictionary = character(), nomatch = NULL)
```

## Arguments

- dictionary:

  A named character vector of labels. The names are expected to match
  the breaks, and the values become the labels.

- nomatch:

  A string to label breaks that do not match any name in `dictionary`.
  When `NULL` (default), the breaks are not translated but are kept
  as-is.

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
[`label_glue()`](https://scales.r-lib.org/dev/reference/label_glue.md),
[`label_parse()`](https://scales.r-lib.org/dev/reference/label_parse.md),
[`label_wrap()`](https://scales.r-lib.org/dev/reference/label_wrap.md)

## Examples

``` r
library(ggplot2)
ggplot(ToothGrowth, aes(x = supp, y = len)) +
  geom_boxplot() +
  scale_x_discrete(
    labels = label_dictionary(c(OJ = "Orange juice", VC = "Vitamin C"))
  )

# Example lookup table
lut <- c(
  "4" = "four wheel drive",
  "r" = "rear wheel drive",
  "f" = "front wheel drive"
)

# Typical usage
demo_discrete(c("4", "r", "f"), labels = label_dictionary(lut))
#> scale_x_discrete(labels = label_dictionary(lut))

# By default, extra values ('w') will remain as-is
demo_discrete(c("4", "r", "f", "w"), labels = label_dictionary(lut))
#> scale_x_discrete(labels = label_dictionary(lut))

# Alternatively, you can relabel extra values
demo_discrete(
  c("4", "r", "f", "w"),
  labels = label_dictionary(lut, nomatch = "unknown")
)
#> scale_x_discrete(labels = label_dictionary(lut, nomatch = "unknown"))
```
