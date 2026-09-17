# Probability transformation

Probability transformation

## Usage

``` r
transform_probability(distribution, ...)

transform_logit()

transform_probit()

probability_trans(distribution, ...)

logit_trans()

probit_trans()
```

## Arguments

- distribution:

  probability distribution. Should be standard R abbreviation so that
  "p" + distribution is a valid cumulative distribution function, "q" +
  distribution is a valid quantile function, and "d" + distribution is a
  valid probability density function.

- ...:

  other arguments passed on to distribution and quantile functions

## Examples

``` r
plot(transform_logit(), xlim = c(0, 1))

plot(transform_probit(), xlim = c(0, 1))
```
