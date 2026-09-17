# Create a new transformation object

A transformation encapsulates a transformation and its inverse, as well
as the information needed to create pleasing breaks and labels. The
`breaks()` function is applied on the un-transformed range of the data,
and the [`format()`](https://rdrr.io/r/base/format.html) function takes
the output of the `breaks()` function and returns well-formatted labels.
Transformations may also include the derivatives of the transformation
and its inverse, but are not required to.

## Usage

``` r
new_transform(
  name,
  transform,
  inverse,
  d_transform = NULL,
  d_inverse = NULL,
  breaks = extended_breaks(),
  minor_breaks = regular_minor_breaks(),
  format = format_format(),
  domain = c(-Inf, Inf)
)

trans_new(
  name,
  transform,
  inverse,
  d_transform = NULL,
  d_inverse = NULL,
  breaks = extended_breaks(),
  minor_breaks = regular_minor_breaks(),
  format = format_format(),
  domain = c(-Inf, Inf)
)

is.transform(x)

is.trans(x)

as.transform(x, arg = deparse(substitute(x)))

as.trans(x, arg = deparse(substitute(x)))
```

## Arguments

- name:

  transformation name

- transform:

  function, or name of function, that performs the transformation

- inverse:

  function, or name of function, that performs the inverse of the
  transformation

- d_transform:

  Optional function, or name of function, that gives the derivative of
  the transformation. May be `NULL`.

- d_inverse:

  Optional function, or name of function, that gives the derivative of
  the inverse of the transformation. May be `NULL`.

- breaks:

  default breaks function for this transformation. The breaks function
  is applied to the un-transformed data.

- minor_breaks:

  default minor breaks function for this transformation.

- format:

  default format for this transformation. The format is applied to
  breaks generated on the un-transformed data.

- domain:

  the allowed range of the data to be transformed. The function in the
  `transform` argument is expected to be able to transform the `domain`
  argument.

## See also

[`transform_asinh`](https://scales.r-lib.org/dev/reference/transform_asinh.md),
[`transform_asn`](https://scales.r-lib.org/dev/reference/transform_asn.md),
[`transform_atanh`](https://scales.r-lib.org/dev/reference/transform_atanh.md),
[`transform_boxcox`](https://scales.r-lib.org/dev/reference/transform_boxcox.md),
[`transform_compose`](https://scales.r-lib.org/dev/reference/transform_compose.md),
[`transform_date`](https://scales.r-lib.org/dev/reference/transform_date.md),
[`transform_exp`](https://scales.r-lib.org/dev/reference/transform_exp.md),
[`transform_hms`](https://scales.r-lib.org/dev/reference/transform_timespan.md),
[`transform_identity`](https://scales.r-lib.org/dev/reference/transform_identity.md),
[`transform_log`](https://scales.r-lib.org/dev/reference/transform_log.md),
[`transform_log10`](https://scales.r-lib.org/dev/reference/transform_log.md),
[`transform_log1p`](https://scales.r-lib.org/dev/reference/transform_log.md),
[`transform_log2`](https://scales.r-lib.org/dev/reference/transform_log.md),
[`transform_logit`](https://scales.r-lib.org/dev/reference/transform_probability.md),
[`transform_modulus`](https://scales.r-lib.org/dev/reference/transform_boxcox.md),
[`transform_probability`](https://scales.r-lib.org/dev/reference/transform_probability.md),
[`transform_probit`](https://scales.r-lib.org/dev/reference/transform_probability.md),
[`transform_pseudo_log`](https://scales.r-lib.org/dev/reference/transform_log.md),
[`transform_reciprocal`](https://scales.r-lib.org/dev/reference/transform_reciprocal.md),
[`transform_reverse`](https://scales.r-lib.org/dev/reference/transform_reverse.md),
[`transform_sqrt`](https://scales.r-lib.org/dev/reference/transform_sqrt.md),
[`transform_time`](https://scales.r-lib.org/dev/reference/transform_time.md),
[`transform_timespan`](https://scales.r-lib.org/dev/reference/transform_timespan.md),
[`transform_yj`](https://scales.r-lib.org/dev/reference/transform_yj.md)
