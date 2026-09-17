# Pretty breaks for date/times

Uses default R break algorithm as implemented in
[`pretty()`](https://rdrr.io/r/base/pretty.html). This is primarily
useful for date/times, as
[`extended_breaks()`](https://scales.r-lib.org/dev/reference/breaks_extended.md)
should do a slightly better job for numeric scales.

## Usage

``` r
breaks_pretty(n = 5, ...)
```

## Arguments

- n:

  Desired number of breaks. You may get slightly more or fewer breaks
  that requested.

- ...:

  other arguments passed on to
  [`pretty()`](https://rdrr.io/r/base/pretty.html)

## Value

All `breaks_()` functions return a function for generating breaks. These
functions takes, as their first argument a vector of values that
represent the data range to provide breaks for. Some will optionally
take a second argument that allows you to specify the number of breaks
to recieve.

## Examples

``` r
one_month <- as.POSIXct(c("2020-05-01", "2020-06-01"))
demo_datetime(one_month)
#> scale_x_datetime()

demo_datetime(one_month, breaks = breaks_pretty(2))
#> scale_x_datetime(breaks = breaks_pretty(2))

demo_datetime(one_month, breaks = breaks_pretty(4))
#> scale_x_datetime(breaks = breaks_pretty(4))


# Tightly spaced date breaks often need custom labels too
demo_datetime(one_month, breaks = breaks_pretty(12))
#> scale_x_datetime(breaks = breaks_pretty(12))

demo_datetime(one_month,
  breaks = breaks_pretty(12),
  labels = label_date_short()
)
#> scale_x_datetime(breaks = breaks_pretty(12), labels = label_date_short())
```
