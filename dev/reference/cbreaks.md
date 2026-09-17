# Compute breaks for continuous scale

**\[superseded\]**

This function wraps up the components needed to go from a continuous
range to a set of breaks and labels suitable for display on axes or
legends.

## Usage

``` r
cbreaks(range, breaks = extended_breaks(), labels = scientific_format())
```

## Arguments

- range:

  numeric vector of length 2 giving the range of the underlying data

- breaks:

  either a vector of break values, or a break function that will make a
  vector of breaks when given the range of the data

- labels:

  either a vector of labels (character vector or list of expression) or
  a format function that will make a vector of labels when called with a
  vector of breaks. Labels can only be specified manually if breaks
  are - it is extremely dangerous to supply labels if you don't know
  what the breaks will be.

## Examples

``` r
cbreaks(c(0, 100))
#> $breaks
#> [1]   0  25  50  75 100
#> 
#> $labels
#> [1] "0.0e+00" "2.5e+01" "5.0e+01" "7.5e+01" "1.0e+02"
#> 
cbreaks(c(0, 100), breaks_pretty(3))
#> $breaks
#> [1]   0  50 100
#> 
#> $labels
#> [1] "0e+00" "5e+01" "1e+02"
#> 
cbreaks(c(0, 100), breaks_pretty(10))
#> $breaks
#>  [1]   0  10  20  30  40  50  60  70  80  90 100
#> 
#> $labels
#>  [1] "0e+00" "1e+01" "2e+01" "3e+01" "4e+01" "5e+01" "6e+01" "7e+01"
#>  [9] "8e+01" "9e+01" "1e+02"
#> 
cbreaks(c(1, 100), log_breaks())
#> $breaks
#> [1]   1  10 100
#> 
#> $labels
#> [1] "1e+00" "1e+01" "1e+02"
#> 
cbreaks(c(1, 1e4), log_breaks())
#> $breaks
#> [1]     1    10   100  1000 10000
#> 
#> $labels
#> [1] "1e+00" "1e+01" "1e+02" "1e+03" "1e+04"
#> 

cbreaks(c(0, 100), labels = math_format())
#> $breaks
#> [1]   0  25  50  75 100
#> 
#> $labels
#> expression(10^0, 10^25, 10^50, 10^75, 10^100)
#> 
cbreaks(c(0, 1), labels = percent_format())
#> $breaks
#> [1] 0.00 0.25 0.50 0.75 1.00
#> 
#> $labels
#> [1] "0%"   "25%"  "50%"  "75%"  "100%"
#> 
cbreaks(c(0, 1e6), labels = comma_format())
#> $breaks
#> [1]       0  250000  500000  750000 1000000
#> 
#> $labels
#> [1] "0"         "250,000"   "500,000"   "750,000"   "1,000,000"
#> 
cbreaks(c(0, 1e6), labels = dollar_format())
#> $breaks
#> [1]       0  250000  500000  750000 1000000
#> 
#> $labels
#> [1] "$0"         "$250,000"   "$500,000"   "$750,000"   "$1,000,000"
#> 
cbreaks(c(0, 30), labels = dollar_format())
#> $breaks
#> [1]  0 10 20 30
#> 
#> $labels
#> [1] "$0"  "$10" "$20" "$30"
#> 

# You can also specify them manually:
cbreaks(c(0, 100), breaks = c(15, 20, 80))
#> $breaks
#> [1] 15 20 80
#> 
#> $labels
#> [1] "1.5e+01" "2.0e+01" "8.0e+01"
#> 
cbreaks(c(0, 100), breaks = c(15, 20, 80), labels = c(1.5, 2.0, 8.0))
#> $breaks
#> [1] 15 20 80
#> 
#> $labels
#> [1] "1.5" "2"   "8"  
#> 
cbreaks(c(0, 100),
  breaks = c(15, 20, 80),
  labels = expression(alpha, beta, gamma)
)
#> $breaks
#> [1] 15 20 80
#> 
#> $labels
#> $labels[[1]]
#> alpha
#> 
#> $labels[[2]]
#> beta
#> 
#> $labels[[3]]
#> gamma
#> 
#> 
```
