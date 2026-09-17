# Interpolated labels

Use `label_glue()` to perform string interpolation using the glue
package. Enclosed expressions will be evaluated as R code.

## Usage

``` r
label_glue(pattern = "{x}", ..., parse = FALSE, .envir = caller_env())
```

## Arguments

- pattern:

  A glue string used for formatting. The `x` variable holds the breaks,
  so that `"{x}"` (default) returns the breaks as-is.

- ...:

  Arguments passed on to
  [`glue::glue()`](https://glue.tidyverse.org/reference/glue.html).

- parse:

  Whether to return labels as expressions.

- .envir:

  \[`environment`:
  [`parent.frame()`](https://rdrr.io/r/base/sys.parent.html)\]  
  Environment to evaluate each expression in. Expressions are evaluated
  from left to right. If `.x` is an environment, the expressions are
  evaluated in that environment and `.envir` is ignored. If `NULL` is
  passed, it is equivalent to
  [`emptyenv()`](https://rdrr.io/r/base/environment.html).

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
[`label_number_auto()`](https://scales.r-lib.org/dev/reference/label_number_auto.md),
[`label_number_si()`](https://scales.r-lib.org/dev/reference/label_number_si.md),
[`label_ordinal()`](https://scales.r-lib.org/dev/reference/label_ordinal.md),
[`label_parse()`](https://scales.r-lib.org/dev/reference/label_parse.md),
[`label_percent()`](https://scales.r-lib.org/dev/reference/label_percent.md),
[`label_pvalue()`](https://scales.r-lib.org/dev/reference/label_pvalue.md),
[`label_scientific()`](https://scales.r-lib.org/dev/reference/label_scientific.md)

Other labels for discrete scales:
[`label_dictionary()`](https://scales.r-lib.org/dev/reference/label_dictionary.md),
[`label_parse()`](https://scales.r-lib.org/dev/reference/label_parse.md),
[`label_wrap()`](https://scales.r-lib.org/dev/reference/label_wrap.md)

## Examples

``` r
# Example variables
animal  <- "penguin"
species <- c("Adelie",  "Chinstrap", "Emperor", "Gentoo")

# Typical use, note that {x} will become the breaks
demo_discrete(species, labels = label_glue("The {x}\n{animal}"))
#> scale_x_discrete(labels = label_glue("The {x}\n{animal}"))

# It adapts to the breaks that are present
demo_discrete(species[-3], labels =  label_glue("The {x}\n{animal}"))
#> scale_x_discrete(labels = label_glue("The {x}\n{animal}"))

# Contrary to directly glueing species + animal, which results in mislabelling!
demo_discrete(species[-3], labels = glue::glue("The {species}\n{animal}"))
#> scale_x_discrete(labels = glue::glue("The {species}\n{animal}"))
```
