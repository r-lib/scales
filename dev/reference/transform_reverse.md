# Reverse transformation

reversing transformation works by multiplying the input with -1. This
means that reverse transformation cannot easily be composed with
transformations that require positive input unless the reversing is done
as a final step.

## Usage

``` r
transform_reverse()

reverse_trans()
```

## Examples

``` r
plot(transform_reverse(), xlim = c(-1, 1))
```
