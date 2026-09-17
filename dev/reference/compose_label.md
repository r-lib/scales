# Compose two or more label formatters together

This labeller provides a general mechanism for composing two or more
labellers together.

## Usage

``` r
compose_label(..., call = caller_env())
```

## Arguments

- ...:

  One or more labelling functions. These will be applied to breaks
  consecutively. [Lambda
  syntax](https://rlang.r-lib.org/reference/as_function.html) is
  allowed.

- call:

  A call to display in error messages.

## Value

All `label_()` functions return a "labelling" function, i.e. a function
that takes a vector `x` and returns a character vector of `length(x)`
giving a label for each input value.

Labelling functions are designed to be used with the `labels` argument
of ggplot2 scales. The examples demonstrate their use with x scales, but
they work similarly for all scales, including those that generate
legends rather than axes.

## Examples

``` r
demo_continuous(
  c(-100, 100),
  labels = compose_label(abs, number, \(x) paste0(x, " foobar"), toupper)
)
#> scale_x_continuous(labels = compose_label(abs, number, function(x) paste0(x, 
#>     " foobar"), toupper))


# Same result
demo_continuous(
  c(-100, 100),
  labels = compose_label(abs, label_number(suffix = " FOOBAR"))
)
#> scale_x_continuous(labels = compose_label(abs, label_number(suffix = " FOOBAR")))
```
