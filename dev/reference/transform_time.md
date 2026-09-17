# Transformation for date-times (class POSIXt)

Transformation for date-times (class POSIXt)

## Usage

``` r
transform_time(tz = NULL)

time_trans(tz = NULL)
```

## Arguments

- tz:

  Optionally supply the time zone. If `NULL`, the default, the time zone
  will be extracted from first input with a non-null tz.

## Examples

``` r
hours <- seq(ISOdate(2000, 3, 20, tz = ""), by = "hour", length.out = 10)
t <- transform_time()
t$transform(hours)
#>  [1] 953553600 953557200 953560800 953564400 953568000 953571600
#>  [7] 953575200 953578800 953582400 953586000
t$inverse(t$transform(hours))
#>  [1] "2000-03-20 12:00:00 UTC" "2000-03-20 13:00:00 UTC"
#>  [3] "2000-03-20 14:00:00 UTC" "2000-03-20 15:00:00 UTC"
#>  [5] "2000-03-20 16:00:00 UTC" "2000-03-20 17:00:00 UTC"
#>  [7] "2000-03-20 18:00:00 UTC" "2000-03-20 19:00:00 UTC"
#>  [9] "2000-03-20 20:00:00 UTC" "2000-03-20 21:00:00 UTC"
t$format(t$breaks(range(hours)))
#> [1] "12:00" "15:00" "18:00" "21:00"
```
