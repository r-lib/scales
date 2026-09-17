# Breaks for timespan data

As timespan units span a variety of bases (1000 below seconds, 60 for
second and minutes, 24 for hours, and 7 for days), the range of the
input data determines the base used for calculating breaks

## Usage

``` r
breaks_timespan(unit = c("secs", "mins", "hours", "days", "weeks"), n = 5)
```

## Arguments

- unit:

  The unit used to interpret numeric data input

- n:

  Desired number of breaks. You may get slightly more or fewer breaks
  that requested.

## Value

All `breaks_()` functions return a function for generating breaks. These
functions takes, as their first argument a vector of values that
represent the data range to provide breaks for. Some will optionally
take a second argument that allows you to specify the number of breaks
to recieve.

## Examples

``` r
demo_timespan(seq(0, 100), breaks = breaks_timespan())
#> scale_x_continuous(breaks = breaks_timespan())

```
