# Transformation for times (class hms)

`transform_timespan()` provides transformations for data encoding time
passed along with breaks and label formatting showing standard unit of
time fitting the range of the data. `transform_hms()` provides the same
but using standard hms idioms and formatting.

## Usage

``` r
transform_timespan(unit = c("secs", "mins", "hours", "days", "weeks"))

timespan_trans(unit = c("secs", "mins", "hours", "days", "weeks"))

transform_hms()

hms_trans()
```

## Arguments

- unit:

  The unit used to interpret numeric input

## Examples

``` r
# transform_timespan allows you to specify the time unit numeric data is
# interpreted in
trans_min <- transform_timespan("mins")
demo_timespan(seq(0, 100), trans = trans_min)
#> scale_x_continuous(trans = trans_min)

# Input already in difftime format is interpreted correctly
demo_timespan(as.difftime(seq(0, 100), units = "secs"), trans = trans_min)
#> scale_x_continuous(trans = trans_min)


if (require("hms")) {
  # transform_hms always assumes seconds
  hms <- round(runif(10) * 86400)
  t <- transform_hms()
  t$transform(hms)
  t$inverse(t$transform(hms))
  t$breaks(hms)
  # The break labels also follow the hms format
  demo_timespan(hms, trans = t)
}
#> Loading required package: hms
#> scale_x_continuous(trans = t)

```
