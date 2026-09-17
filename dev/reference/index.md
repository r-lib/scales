# Package index

## Axis labels

Use these functions with the `labels` argument to ggplot2 scales to
control the formatting of axis labels and legend keys.

- [`label_bytes()`](https://scales.r-lib.org/dev/reference/label_bytes.md)
  : Label bytes (1 kB, 2 MB, etc)
- [`label_currency()`](https://scales.r-lib.org/dev/reference/label_currency.md)
  : Label currencies (\$100, €2.50, etc)
- [`label_date()`](https://scales.r-lib.org/dev/reference/label_date.md)
  [`label_date_short()`](https://scales.r-lib.org/dev/reference/label_date.md)
  [`label_time()`](https://scales.r-lib.org/dev/reference/label_date.md)
  [`label_timespan()`](https://scales.r-lib.org/dev/reference/label_date.md)
  : Label date/times
- [`label_dictionary()`](https://scales.r-lib.org/dev/reference/label_dictionary.md)
  : Labels from lookup tables
- [`label_glue()`](https://scales.r-lib.org/dev/reference/label_glue.md)
  : Interpolated labels
- [`label_log()`](https://scales.r-lib.org/dev/reference/label_log.md)
  [`format_log()`](https://scales.r-lib.org/dev/reference/label_log.md)
  : Label numbers in log format (10^3, 10^6, etc)
- [`label_number()`](https://scales.r-lib.org/dev/reference/label_number.md)
  [`label_comma()`](https://scales.r-lib.org/dev/reference/label_number.md)
  : Label numbers in decimal format (e.g. 0.12, 1,234)
- [`label_number_auto()`](https://scales.r-lib.org/dev/reference/label_number_auto.md)
  : Label numbers, avoiding scientific notation where possible
- [`label_ordinal()`](https://scales.r-lib.org/dev/reference/label_ordinal.md)
  [`ordinal_english()`](https://scales.r-lib.org/dev/reference/label_ordinal.md)
  [`ordinal_french()`](https://scales.r-lib.org/dev/reference/label_ordinal.md)
  [`ordinal_spanish()`](https://scales.r-lib.org/dev/reference/label_ordinal.md)
  : Label ordinal numbers (1st, 2nd, 3rd, etc)
- [`label_parse()`](https://scales.r-lib.org/dev/reference/label_parse.md)
  [`label_math()`](https://scales.r-lib.org/dev/reference/label_parse.md)
  : Label with mathematical annotations
- [`label_percent()`](https://scales.r-lib.org/dev/reference/label_percent.md)
  : Label percentages (2.5%, 50%, etc)
- [`label_pvalue()`](https://scales.r-lib.org/dev/reference/label_pvalue.md)
  : Label p-values (e.g. \<0.001, 0.25, p \>= 0.99)
- [`label_scientific()`](https://scales.r-lib.org/dev/reference/label_scientific.md)
  : Label numbers with scientific notation (e.g. 1e05, 1.5e-02)
- [`label_wrap()`](https://scales.r-lib.org/dev/reference/label_wrap.md)
  : Label strings by wrapping across multiple lines
- [`compose_label()`](https://scales.r-lib.org/dev/reference/compose_label.md)
  : Compose two or more label formatters together
- [`number_options()`](https://scales.r-lib.org/dev/reference/number_options.md)
  : Number options

## Axis breaks

Use these functions with the `breaks` argument to ggplot2 scales to
control the position of axis breaks and values of legend keys.

- [`breaks_exp()`](https://scales.r-lib.org/dev/reference/breaks_exp.md)
  : Breaks for exponentially transformed data
- [`breaks_extended()`](https://scales.r-lib.org/dev/reference/breaks_extended.md)
  : Automatic breaks for numeric axes
- [`breaks_log()`](https://scales.r-lib.org/dev/reference/breaks_log.md)
  : Breaks for log axes
- [`breaks_pretty()`](https://scales.r-lib.org/dev/reference/breaks_pretty.md)
  : Pretty breaks for date/times
- [`breaks_timespan()`](https://scales.r-lib.org/dev/reference/breaks_timespan.md)
  : Breaks for timespan data
- [`breaks_width()`](https://scales.r-lib.org/dev/reference/breaks_width.md)
  : Equally spaced breaks
- [`minor_breaks_width()`](https://scales.r-lib.org/dev/reference/minor_breaks_width.md)
  [`minor_breaks_n()`](https://scales.r-lib.org/dev/reference/minor_breaks_width.md)
  : Minor breaks
- [`minor_breaks_log()`](https://scales.r-lib.org/dev/reference/minor_breaks_log.md)
  : Minor breaks for log-10 axes

## Bounds: ranges & rescaling

Functions for rescaling data and adjusting scale ranges.

- [`rescale()`](https://scales.r-lib.org/dev/reference/rescale.md) :
  Rescale continuous vector to have specified minimum and maximum
- [`rescale_max()`](https://scales.r-lib.org/dev/reference/rescale_max.md)
  : Rescale numeric vector to have specified maximum
- [`rescale_mid()`](https://scales.r-lib.org/dev/reference/rescale_mid.md)
  : Rescale vector to have specified minimum, midpoint, and maximum
- [`rescale_none()`](https://scales.r-lib.org/dev/reference/rescale_none.md)
  : Don't perform rescaling
- [`pal_rescale()`](https://scales.r-lib.org/dev/reference/pal_rescale.md)
  [`rescale_pal()`](https://scales.r-lib.org/dev/reference/pal_rescale.md)
  : Rescale palette (continuous)
- [`expand_range()`](https://scales.r-lib.org/dev/reference/expand_range.md)
  : Expand a range with a multiplicative or additive constant
- [`zero_range()`](https://scales.r-lib.org/dev/reference/zero_range.md)
  : Determine if range of vector is close to zero, with a specified
  tolerance
- [`oob_censor()`](https://scales.r-lib.org/dev/reference/oob.md)
  [`oob_censor_any()`](https://scales.r-lib.org/dev/reference/oob.md)
  [`oob_discard()`](https://scales.r-lib.org/dev/reference/oob.md)
  [`oob_squish()`](https://scales.r-lib.org/dev/reference/oob.md)
  [`oob_squish_any()`](https://scales.r-lib.org/dev/reference/oob.md)
  [`oob_squish_infinite()`](https://scales.r-lib.org/dev/reference/oob.md)
  [`oob_keep()`](https://scales.r-lib.org/dev/reference/oob.md)
  [`censor()`](https://scales.r-lib.org/dev/reference/oob.md)
  [`discard()`](https://scales.r-lib.org/dev/reference/oob.md)
  [`squish()`](https://scales.r-lib.org/dev/reference/oob.md)
  [`squish_infinite()`](https://scales.r-lib.org/dev/reference/oob.md) :
  Out of bounds handling

## Transformations

Functions to describe common and custom scale transformations their
inverses, and ways of generating breaks and labels.

- [`transform_asinh()`](https://scales.r-lib.org/dev/reference/transform_asinh.md)
  [`asinh_trans()`](https://scales.r-lib.org/dev/reference/transform_asinh.md)
  : Inverse Hyperbolic Sine transformation
- [`transform_asn()`](https://scales.r-lib.org/dev/reference/transform_asn.md)
  [`asn_trans()`](https://scales.r-lib.org/dev/reference/transform_asn.md)
  : Arc-sin square root transformation
- [`transform_atanh()`](https://scales.r-lib.org/dev/reference/transform_atanh.md)
  [`atanh_trans()`](https://scales.r-lib.org/dev/reference/transform_atanh.md)
  : Arc-tangent transformation
- [`transform_boxcox()`](https://scales.r-lib.org/dev/reference/transform_boxcox.md)
  [`boxcox_trans()`](https://scales.r-lib.org/dev/reference/transform_boxcox.md)
  [`transform_modulus()`](https://scales.r-lib.org/dev/reference/transform_boxcox.md)
  [`modulus_trans()`](https://scales.r-lib.org/dev/reference/transform_boxcox.md)
  : Box-Cox & modulus transformations
- [`transform_compose()`](https://scales.r-lib.org/dev/reference/transform_compose.md)
  [`compose_trans()`](https://scales.r-lib.org/dev/reference/transform_compose.md)
  : Compose two or more transformations together
- [`transform_date()`](https://scales.r-lib.org/dev/reference/transform_date.md)
  [`date_trans()`](https://scales.r-lib.org/dev/reference/transform_date.md)
  : Transformation for dates (class Date)
- [`transform_exp()`](https://scales.r-lib.org/dev/reference/transform_exp.md)
  [`exp_trans()`](https://scales.r-lib.org/dev/reference/transform_exp.md)
  : Exponential transformation (inverse of log transformation)
- [`transform_identity()`](https://scales.r-lib.org/dev/reference/transform_identity.md)
  [`identity_trans()`](https://scales.r-lib.org/dev/reference/transform_identity.md)
  : Identity transformation (do nothing)
- [`transform_log()`](https://scales.r-lib.org/dev/reference/transform_log.md)
  [`transform_log10()`](https://scales.r-lib.org/dev/reference/transform_log.md)
  [`transform_log2()`](https://scales.r-lib.org/dev/reference/transform_log.md)
  [`transform_log1p()`](https://scales.r-lib.org/dev/reference/transform_log.md)
  [`log_trans()`](https://scales.r-lib.org/dev/reference/transform_log.md)
  [`log10_trans()`](https://scales.r-lib.org/dev/reference/transform_log.md)
  [`log2_trans()`](https://scales.r-lib.org/dev/reference/transform_log.md)
  [`log1p_trans()`](https://scales.r-lib.org/dev/reference/transform_log.md)
  [`transform_pseudo_log()`](https://scales.r-lib.org/dev/reference/transform_log.md)
  [`pseudo_log_trans()`](https://scales.r-lib.org/dev/reference/transform_log.md)
  : Log transformations
- [`transform_probability()`](https://scales.r-lib.org/dev/reference/transform_probability.md)
  [`transform_logit()`](https://scales.r-lib.org/dev/reference/transform_probability.md)
  [`transform_probit()`](https://scales.r-lib.org/dev/reference/transform_probability.md)
  [`probability_trans()`](https://scales.r-lib.org/dev/reference/transform_probability.md)
  [`logit_trans()`](https://scales.r-lib.org/dev/reference/transform_probability.md)
  [`probit_trans()`](https://scales.r-lib.org/dev/reference/transform_probability.md)
  : Probability transformation
- [`transform_reciprocal()`](https://scales.r-lib.org/dev/reference/transform_reciprocal.md)
  [`reciprocal_trans()`](https://scales.r-lib.org/dev/reference/transform_reciprocal.md)
  : Reciprocal transformation
- [`transform_reverse()`](https://scales.r-lib.org/dev/reference/transform_reverse.md)
  [`reverse_trans()`](https://scales.r-lib.org/dev/reference/transform_reverse.md)
  : Reverse transformation
- [`transform_sqrt()`](https://scales.r-lib.org/dev/reference/transform_sqrt.md)
  [`sqrt_trans()`](https://scales.r-lib.org/dev/reference/transform_sqrt.md)
  : Square-root transformation
- [`transform_time()`](https://scales.r-lib.org/dev/reference/transform_time.md)
  [`time_trans()`](https://scales.r-lib.org/dev/reference/transform_time.md)
  : Transformation for date-times (class POSIXt)
- [`transform_timespan()`](https://scales.r-lib.org/dev/reference/transform_timespan.md)
  [`timespan_trans()`](https://scales.r-lib.org/dev/reference/transform_timespan.md)
  [`transform_hms()`](https://scales.r-lib.org/dev/reference/transform_timespan.md)
  [`hms_trans()`](https://scales.r-lib.org/dev/reference/transform_timespan.md)
  : Transformation for times (class hms)
- [`transform_yj()`](https://scales.r-lib.org/dev/reference/transform_yj.md)
  [`yj_trans()`](https://scales.r-lib.org/dev/reference/transform_yj.md)
  : Yeo-Johnson transformation

## Colour palettes & colour mapping

Functions for specifying colour palettes, colour mapping, and various
helper functions.

- [`pal_brewer()`](https://scales.r-lib.org/dev/reference/pal_brewer.md)
  [`brewer_pal()`](https://scales.r-lib.org/dev/reference/pal_brewer.md)
  : Colour Brewer palette (discrete)
- [`pal_dichromat()`](https://scales.r-lib.org/dev/reference/pal_dichromat.md)
  [`dichromat_pal()`](https://scales.r-lib.org/dev/reference/pal_dichromat.md)
  : Dichromat (colour-blind) palette (discrete)
- [`pal_gradient_div()`](https://scales.r-lib.org/dev/reference/pal_gradient_div.md)
  [`div_gradient_pal()`](https://scales.r-lib.org/dev/reference/pal_gradient_div.md)
  [`pal_div_gradient()`](https://scales.r-lib.org/dev/reference/pal_gradient_div.md)
  : Diverging colour gradient (continuous).
- [`pal_gradient_n()`](https://scales.r-lib.org/dev/reference/pal_gradient_n.md)
  [`gradient_n_pal()`](https://scales.r-lib.org/dev/reference/pal_gradient_n.md)
  : Arbitrary colour gradient palette (continuous)
- [`pal_grey()`](https://scales.r-lib.org/dev/reference/pal_grey.md)
  [`grey_pal()`](https://scales.r-lib.org/dev/reference/pal_grey.md) :
  Grey scale palette (discrete)
- [`pal_hue()`](https://scales.r-lib.org/dev/reference/pal_hue.md)
  [`hue_pal()`](https://scales.r-lib.org/dev/reference/pal_hue.md) : Hue
  palette (discrete)
- [`pal_gradient_seq()`](https://scales.r-lib.org/dev/reference/pal_gradient_seq.md)
  [`seq_gradient_pal()`](https://scales.r-lib.org/dev/reference/pal_gradient_seq.md)
  [`pal_seq_gradient()`](https://scales.r-lib.org/dev/reference/pal_gradient_seq.md)
  : Sequential colour gradient palette (continuous)
- [`pal_rescale()`](https://scales.r-lib.org/dev/reference/pal_rescale.md)
  [`rescale_pal()`](https://scales.r-lib.org/dev/reference/pal_rescale.md)
  : Rescale palette (continuous)
- [`pal_viridis()`](https://scales.r-lib.org/dev/reference/pal_viridis.md)
  [`viridis_pal()`](https://scales.r-lib.org/dev/reference/pal_viridis.md)
  : Viridis palette
- [`col2hcl()`](https://scales.r-lib.org/dev/reference/col2hcl.md) :
  Modify standard R colour in hcl colour space.
- [`col_mix()`](https://scales.r-lib.org/dev/reference/col_mix.md) : Mix
  colours
- [`col_numeric()`](https://scales.r-lib.org/dev/reference/col_numeric.md)
  [`col_bin()`](https://scales.r-lib.org/dev/reference/col_numeric.md)
  [`col_quantile()`](https://scales.r-lib.org/dev/reference/col_numeric.md)
  [`col_factor()`](https://scales.r-lib.org/dev/reference/col_numeric.md)
  : Colour mapping
- [`col_shift()`](https://scales.r-lib.org/dev/reference/colour_manip.md)
  [`col_lighter()`](https://scales.r-lib.org/dev/reference/colour_manip.md)
  [`col_darker()`](https://scales.r-lib.org/dev/reference/colour_manip.md)
  [`col_saturate()`](https://scales.r-lib.org/dev/reference/colour_manip.md)
  : Colour manipulation
- [`colour_ramp()`](https://scales.r-lib.org/dev/reference/colour_ramp.md)
  : Fast colour interpolation
- [`new_continuous_palette()`](https://scales.r-lib.org/dev/reference/new_continuous_palette.md)
  [`new_discrete_palette()`](https://scales.r-lib.org/dev/reference/new_continuous_palette.md)
  [`is_pal()`](https://scales.r-lib.org/dev/reference/new_continuous_palette.md)
  [`is_continuous_pal()`](https://scales.r-lib.org/dev/reference/new_continuous_palette.md)
  [`is_discrete_pal()`](https://scales.r-lib.org/dev/reference/new_continuous_palette.md)
  [`is_colour_pal()`](https://scales.r-lib.org/dev/reference/new_continuous_palette.md)
  [`is_numeric_pal()`](https://scales.r-lib.org/dev/reference/new_continuous_palette.md)
  [`palette_nlevels()`](https://scales.r-lib.org/dev/reference/new_continuous_palette.md)
  [`palette_na_safe()`](https://scales.r-lib.org/dev/reference/new_continuous_palette.md)
  [`palette_type()`](https://scales.r-lib.org/dev/reference/new_continuous_palette.md)
  [`as_discrete_pal()`](https://scales.r-lib.org/dev/reference/new_continuous_palette.md)
  [`as_continuous_pal()`](https://scales.r-lib.org/dev/reference/new_continuous_palette.md)
  : Constructors for palettes
- [`muted()`](https://scales.r-lib.org/dev/reference/muted.md) : Mute
  standard colour
- [`alpha()`](https://scales.r-lib.org/dev/reference/alpha.md) : Modify
  colour transparency
- [`palette-recommendations`](https://scales.r-lib.org/dev/reference/palette-recommendations.md)
  : Recommendations for colour palettes

## Non-colour palette functions

Functions to help scale non-colour aesthetics.

- [`pal_area()`](https://scales.r-lib.org/dev/reference/pal_area.md)
  [`area_pal()`](https://scales.r-lib.org/dev/reference/pal_area.md)
  [`abs_area()`](https://scales.r-lib.org/dev/reference/pal_area.md) :
  Area palettes (continuous)
- [`pal_identity()`](https://scales.r-lib.org/dev/reference/pal_identity.md)
  [`identity_pal()`](https://scales.r-lib.org/dev/reference/pal_identity.md)
  : Identity palette
- [`pal_linetype()`](https://scales.r-lib.org/dev/reference/pal_linetype.md)
  [`linetype_pal()`](https://scales.r-lib.org/dev/reference/pal_linetype.md)
  : Line type palette (discrete)
- [`pal_manual()`](https://scales.r-lib.org/dev/reference/pal_manual.md)
  [`manual_pal()`](https://scales.r-lib.org/dev/reference/pal_manual.md)
  : Manual palette (discrete)
- [`pal_rescale()`](https://scales.r-lib.org/dev/reference/pal_rescale.md)
  [`rescale_pal()`](https://scales.r-lib.org/dev/reference/pal_rescale.md)
  : Rescale palette (continuous)
- [`pal_shape()`](https://scales.r-lib.org/dev/reference/pal_shape.md)
  [`shape_pal()`](https://scales.r-lib.org/dev/reference/pal_shape.md) :
  Shape palette (discrete)

## Creating your own scales and mutable ranges

Scales control the details of how data values are translated to visual
properties. The following functions help users create (and update)
custom scales: pulling together palettes, bounding functions and
transformations to provide a complete pathway from raw data to
perceptual properties.

- [`cscale()`](https://scales.r-lib.org/dev/reference/cscale.md) :
  Continuous scale
- [`dscale()`](https://scales.r-lib.org/dev/reference/dscale.md) :
  Discrete scale
- [`train_continuous()`](https://scales.r-lib.org/dev/reference/train_continuous.md)
  : Train (update) a continuous scale
- [`train_discrete()`](https://scales.r-lib.org/dev/reference/train_discrete.md)
  : Train (update) a discrete scale
- [`Range`](https://scales.r-lib.org/dev/reference/Range.md)
  [`DiscreteRange`](https://scales.r-lib.org/dev/reference/Range.md)
  [`ContinuousRange`](https://scales.r-lib.org/dev/reference/Range.md) :
  Mutable ranges
