# Superseded interface to `label_parse()`/`label_math()`

**\[superseded\]**

These functions are kept for backward compatibility; you should switch
to
[`label_parse()`](https://scales.r-lib.org/dev/reference/label_parse.md)/[`label_math()`](https://scales.r-lib.org/dev/reference/label_parse.md)
for new code.

## Usage

``` r
parse_format()

math_format(expr = 10^.x, format = force)
```

## Arguments

- expr:

  expression to use

- format:

  another format function to apply prior to mathematical
  transformation - this makes it easier to use floating point numbers in
  mathematical expressions.
