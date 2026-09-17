# Compute range of transformed values

Silently drops any ranges outside of the domain of `transform`.

## Usage

``` r
trim_to_domain(transform, x)

trans_range(transform, x)
```

## Arguments

- transform:

  a transformation object, or the name of a transformation object given
  as a string.

- x:

  a numeric vector to compute the range of
