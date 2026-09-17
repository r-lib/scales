# Label numbers in log format (10^3, 10^6, etc)

`label_log()` and `format_log()` display numbers as base^exponent, using
superscript formatting. `label_log()` returns expressions suitable for
labelling in scales, whereas `format_log()` returns deparsed text.

## Usage

``` r
label_log(base = 10, digits = 3, signed = NULL)

format_log(x, base = 10, signed = NULL, ...)
```

## Arguments

- base:

  Base of logarithm to use

- digits:

  Number of significant digits to show for the exponent. Argument is
  passed on to [`base::format()`](https://rdrr.io/r/base/format.html).

- signed:

  Should a `+` or `-` be displayed as a prefix? The default, `NULL`,
  displays signs if there are zeroes or negative numbers present.

- x:

  A numeric vector to format

- ...:

  Passed on to [`format()`](https://rdrr.io/r/base/format.html).

## Value

All `label_()` functions return a "labelling" function, i.e. a function
that takes a vector `x` and returns a character vector of `length(x)`
giving a label for each input value.

Labelling functions are designed to be used with the `labels` argument
of ggplot2 scales. The examples demonstrate their use with x scales, but
they work similarly for all scales, including those that generate
legends rather than axes.

## See also

[`breaks_log()`](https://scales.r-lib.org/dev/reference/breaks_log.md)
for the related breaks algorithm.

Other labels for log scales:
[`label_bytes()`](https://scales.r-lib.org/dev/reference/label_bytes.md),
[`label_number_si()`](https://scales.r-lib.org/dev/reference/label_number_si.md),
[`label_scientific()`](https://scales.r-lib.org/dev/reference/label_scientific.md)

## Examples

``` r
library(ggplot2)
ggplot(msleep, aes(x = bodywt, y = sleep_total)) +
  geom_point() +
  scale_x_log10(labels = label_log())

demo_log10(c(1, 1e5), labels = label_log())
#> scale_x_log10(labels = label_log())

demo_log10(c(1, 1e5), breaks = breaks_log(base = 2), labels = label_log(base = 2))
#> scale_x_log10(breaks = breaks_log(base = 2), labels = label_log(base = 2))

format_log(c(0.1, 1, 10))
#> [1] "10^-1" "10^ 0" "10^ 1"
```
