# Older interface to `label_bytes()`

**\[superseded\]**

These functions are kept for backward compatibility, but you should
switch to
[`label_bytes()`](https://scales.r-lib.org/dev/reference/label_bytes.md)
for new code.

## Usage

``` r
number_bytes_format(symbol = "auto", units = "binary", ...)

number_bytes(x, symbol = "auto", units = c("binary", "si"), accuracy = 1, ...)
```

## Arguments

- symbol:

  byte symbol to use. If "auto" the symbol used will be determined
  separately for each value of `x`. Valid symbols are "B", "kB", "MB",
  "GB", "TB", "PB", "EB", "ZB", and "YB" for SI units, and the "iB"
  variants for binary units.

- units:

  which unit base to use, "binary" (1024 base) or "si" (1000 base)
