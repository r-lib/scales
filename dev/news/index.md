# Changelog

## scales (development version)

- New
  [`oob_censor_infinite()`](https://scales.r-lib.org/dev/reference/oob.md)
  function, which replaces only infinite values, `-Inf` and `Inf`, with
  `NA` ([\#429](https://github.com/r-lib/scales/issues/429)).
- Rename `pal_gradient_*` functions for consistency: Now
  `pal_gradient_seq` and `pal_gradient_div`
- Argument `only_loose` added to
  [`breaks_extended()`](https://scales.r-lib.org/dev/reference/breaks_extended.md)
  as a shortcut to implement labeling::extended(only.loose)

## scales 1.4.0

CRAN release: 2025-04-24

- Range training now supports custom classes. Continuous classes require
  a [`range()`](https://rdrr.io/r/base/range.html) method that returns
  numeric values. Discrete classes require a
  [`levels()`](https://rdrr.io/r/base/levels.html) method (and
  optionally a [`droplevels()`](https://rdrr.io/r/base/droplevels.html)
  method) ([\#480](https://github.com/r-lib/scales/issues/480)).
- New
  [`label_glue()`](https://scales.r-lib.org/dev/reference/label_glue.md)
  labelling function for interpolated strings
  ([\#457](https://github.com/r-lib/scales/issues/457)).
- [`fullseq()`](https://scales.r-lib.org/dev/reference/fullseq.md) and
  by extension
  [`breaks_width()`](https://scales.r-lib.org/dev/reference/breaks_width.md)
  can now deal with unsorted ranges
  ([\#435](https://github.com/r-lib/scales/issues/435)).
- New `label_date_short(leading)` argument to replace leading zeroes
  ([\#442](https://github.com/r-lib/scales/issues/442))
- [`breaks_pretty()`](https://scales.r-lib.org/dev/reference/breaks_pretty.md)
  will return the input limit when it has no range
  ([\#446](https://github.com/r-lib/scales/issues/446))
- [`breaks_exp()`](https://scales.r-lib.org/dev/reference/breaks_exp.md)
  now provides more sensible breaks for the exponential transform
- [`transform_exp()`](https://scales.r-lib.org/dev/reference/transform_exp.md)
  now has more sensible breaks, available in
  [`breaks_exp()`](https://scales.r-lib.org/dev/reference/breaks_exp.md)
  ([@teunbrand](https://github.com/teunbrand),
  [\#405](https://github.com/r-lib/scales/issues/405)).
- The scales package now keeps track of known palettes. These can be
  retrieved using `get_palette()` or registered using `set_palette()`
  ([\#396](https://github.com/r-lib/scales/issues/396)).
- [`label_log()`](https://scales.r-lib.org/dev/reference/label_log.md)
  has a `signed` argument for displaying negative numbers
  ([@teunbrand](https://github.com/teunbrand),
  [\#421](https://github.com/r-lib/scales/issues/421)).
- New
  [`label_dictionary()`](https://scales.r-lib.org/dev/reference/label_dictionary.md)
  for named lookup of labels
  ([\#458](https://github.com/r-lib/scales/issues/458)).
- New function
  [`compose_label()`](https://scales.r-lib.org/dev/reference/compose_label.md)
  to chain together label formatting functions
  ([\#462](https://github.com/r-lib/scales/issues/462))
- Palette function now have classes, attributes and coercion methods
  ([@teunbrand](https://github.com/teunbrand),
  [\#426](https://github.com/r-lib/scales/issues/426)).
- Added colour manipulation functions:
  [`col_shift()`](https://scales.r-lib.org/dev/reference/colour_manip.md),
  [`col_saturate()`](https://scales.r-lib.org/dev/reference/colour_manip.md),
  [`col_darker()`](https://scales.r-lib.org/dev/reference/colour_manip.md),
  [`col_lighter()`](https://scales.r-lib.org/dev/reference/colour_manip.md)
  and [`col_mix()`](https://scales.r-lib.org/dev/reference/col_mix.md)
  ([@teunbrand](https://github.com/teunbrand),
  [\#423](https://github.com/r-lib/scales/issues/423))
- [`label_date_short()`](https://scales.r-lib.org/dev/reference/label_date.md)
  gains `tz` and `locale` argument
  ([\#478](https://github.com/r-lib/scales/issues/478))

## scales 1.3.0

CRAN release: 2023-11-28

### Better type support

- `rescale(I(x), ...)` and `rescale_mid(I(x), ...)` return `I(x)`
  unaltered ([@teunbrand](https://github.com/teunbrand),
  [\#403](https://github.com/r-lib/scales/issues/403)).
- Add a rescale method for `difftime` objects
  ([\#382](https://github.com/r-lib/scales/issues/382))
- Add better support for `difftime` objects.
  [`label_timespan()`](https://scales.r-lib.org/dev/reference/label_date.md)
  adds functionality for adding correct unit suffix to timespan data,
  [`breaks_timespan()`](https://scales.r-lib.org/dev/reference/breaks_timespan.md)
  adds functionality for finding pleasant breakpoints across the various
  bases in time units, while
  [`transform_timespan()`](https://scales.r-lib.org/dev/reference/transform_timespan.md)
  wraps it all together and provides an alternative to
  [`transform_hms()`](https://scales.r-lib.org/dev/reference/transform_timespan.md)
  ([\#212](https://github.com/r-lib/scales/issues/212))

### Ranges

- [`train_continuous()`](https://scales.r-lib.org/dev/reference/train_continuous.md)
  coerces `new` to numeric before calculating range
  ([@teunbrand](https://github.com/teunbrand),
  [\#369](https://github.com/r-lib/scales/issues/369)).
- Training on factor data no longer sorts the range after multiple
  training passes if the new `fct` argument of
  [`train_discrete()`](https://scales.r-lib.org/dev/reference/train_discrete.md)
  is used ([\#383](https://github.com/r-lib/scales/issues/383))
- The `DiscreteRange` class now keeps track on whether it has been
  trained on factor data.
- Attempt to make the sort behavior of the range consistent for
  character vectors during training. Mixing of character and factor data
  will make the factor level order take precedence no matter if the
  training starts with a charactor vector

### Transformations

- Transformation function have been renamed to `transform_*`-prefixed
  names instead of `*_trans`-suffixed names. This allows for a better
  tab-completion search of transformations. The S3 class of
  transformations has been renamed from `"trans"` to `"transform"`.
  [`new_transform()`](https://scales.r-lib.org/dev/reference/new_transform.md)
  replaces
  [`trans_new()`](https://scales.r-lib.org/dev/reference/new_transform.md)
  and
  [`trim_to_domain()`](https://scales.r-lib.org/dev/reference/trim_to_domain.md)
  replaces
  [`trans_range()`](https://scales.r-lib.org/dev/reference/trim_to_domain.md).
  All old functions are kept for posterity.
- [`transform_sqrt()`](https://scales.r-lib.org/dev/reference/transform_sqrt.md)
  no longer returns an inverse for values outside of its domain
  ([\#214](https://github.com/r-lib/scales/issues/214))
- Add an inverse (area) hyperbolic sine transformation
  [`transform_asinh()`](https://scales.r-lib.org/dev/reference/transform_asinh.md),
  which provides a logarithm-like transformation of a space, but which
  accommodates negative values
  ([\#297](https://github.com/r-lib/scales/issues/297))
- Correct the domain calculation for
  [`transform_compose()`](https://scales.r-lib.org/dev/reference/transform_compose.md)
  ([@mjskay](https://github.com/mjskay),
  [\#408](https://github.com/r-lib/scales/issues/408)).
- Transformation objects can optionally include the derivatives of the
  transform and the inverse transform
  ([@mjskay](https://github.com/mjskay),
  [\#322](https://github.com/r-lib/scales/issues/322)).

### Misc

- The `scale_cut` argument in
  [`number()`](https://scales.r-lib.org/dev/reference/number.md) now
  works as advertised for values below the lowest cut value
  ([\#346](https://github.com/r-lib/scales/issues/346))
- `scale_cut` will now choose a more appropriate cut in the case of the
  first cut creating an irrational-ish number.
- Added a new option to the `style_positive` argument in `label_*()`
  functions. Setting this to `"space"` will add a figure space in front
  of the number to make it easier to align positive and negative values
  as figure space takes up the same amount of space as `-`
  ([\#366](https://github.com/r-lib/scales/issues/366))
- [`label_dollar()`](https://scales.r-lib.org/dev/reference/dollar_format.md)
  has been superseeded by
  [`label_currency()`](https://scales.r-lib.org/dev/reference/label_currency.md)
  for clarity ([\#344](https://github.com/r-lib/scales/issues/344))
- Palette functions now have the `pal_`-prefix. The old `_pal`-suffixed
  versions are kept for backward compatibility.

## scales 1.2.1

CRAN release: 2022-08-19

- Re-document to fix HTML issues in `.Rd`.

## scales 1.2.0

CRAN release: 2022-04-13

### New features

- [`label_number()`](https://scales.r-lib.org/dev/reference/label_number.md):

  - New `style_positive` and `style_negative` argument control how
    positive and negative numbers are styled
    ([\#249](https://github.com/r-lib/scales/issues/249),
    [\#262](https://github.com/r-lib/scales/issues/262)).

  - The `prefix` comes after the negative sign, rather than before it,
    yielding (e.g) the correct `-$1` instead of `$-1`.

  - New `scale_cut` argument enables independent scaling of different
    parts of the range. This is useful in
    [`label_dollar()`](https://scales.r-lib.org/dev/reference/dollar_format.md)
    to support scaling of large numbers by suffix (e.g. “M” for million,
    “B” for billion). It can be used with
    [`cut_short_scale()`](https://scales.r-lib.org/dev/reference/number.md)
    when billion = thousand million and
    [`cut_long_scale()`](https://scales.r-lib.org/dev/reference/number.md)
    when billion = million million (initial implementation provided by
    [@davidchall](https://github.com/davidchall)). Additionally, the
    accuracy is now computed per scale category, so rescaled values can
    have different numbers of decimal places
    ([\#339](https://github.com/r-lib/scales/issues/339)).

  - [`label_number_si()`](https://scales.r-lib.org/dev/reference/label_number_si.md)
    is deprecated because it previously used [short scale
    abbreviations](https://en.wikipedia.org/wiki/Long_and_short_scales)
    instead of the correct [SI
    prefixes](https://en.wikipedia.org/wiki/Metric_prefix). You can
    mimic the previous results with
    `label_number(scale_cut = cut_scale_short())` or get real SI labels
    with `label_number(scale_cut = cut_SI("m"))`
    ([\#339](https://github.com/r-lib/scales/issues/339), with help from
    [@davidchall](https://github.com/davidchall)).

- [`label_bytes()`](https://scales.r-lib.org/dev/reference/label_bytes.md)
  now correctly accounts for the `scale` argument when choosing auto
  units ([@davidchall](https://github.com/davidchall),
  [\#235](https://github.com/r-lib/scales/issues/235)).

- [`label_date()`](https://scales.r-lib.org/dev/reference/label_date.md)
  and
  [`label_time()`](https://scales.r-lib.org/dev/reference/label_date.md)
  gain a `locale` argument that allows you to set the locale used to
  generate day and month names
  ([\#309](https://github.com/r-lib/scales/issues/309)).

- New
  [`label_log()`](https://scales.r-lib.org/dev/reference/label_log.md)
  displays the base and a superscript exponent, for use with logarithmic
  axes ([@davidchall](https://github.com/davidchall),
  [\#312](https://github.com/r-lib/scales/issues/312)).

- New
  [`compose_trans()`](https://scales.r-lib.org/dev/reference/transform_compose.md)
  allows arbitrary composition of transformers. This is mostly easily
  achieved by passing a character vector whenever you might previously
  have passed the name of a single transformer. For example,
  `scale_y_continuous(trans = c("log10", "reverse"))` will create a
  reverse log-10 scale
  ([\#287](https://github.com/r-lib/scales/issues/287)).

### Bug fixes and minor improvements

- [`breaks_width()`](https://scales.r-lib.org/dev/reference/breaks_width.md)
  now supports units like `"3 months"` in the `offset` argument.

- [`col_quantile()`](https://scales.r-lib.org/dev/reference/col_numeric.md)
  no longer errors if data is sufficiently skewed that we can’t generate
  the requested number of unique colours
  ([\#294](https://github.com/r-lib/scales/issues/294)).

- `dollar(negative_parens)` is deprecated in favour of
  `style_negative = "parens"`.

- [`hue_pal()`](https://scales.r-lib.org/dev/reference/pal_hue.md)
  respects `h.start` once again
  ([\#288](https://github.com/r-lib/scales/issues/288)).

- [`label_number_auto()`](https://scales.r-lib.org/dev/reference/label_number_auto.md)
  correctly formats single numbers that are greater than 1e+06 without
  an error ([@karawoo](https://github.com/karawoo),
  [\#321](https://github.com/r-lib/scales/issues/321))

- [`manual_pal()`](https://scales.r-lib.org/dev/reference/pal_manual.md)
  now always returns an unnamed colour vector, which is easy to use with
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  ([@yutannihilation](https://github.com/yutannihilation),
  [\#284](https://github.com/r-lib/scales/issues/284)).

- [`time_trans()`](https://scales.r-lib.org/dev/reference/transform_time.md)
  and
  [`date_trans()`](https://scales.r-lib.org/dev/reference/transform_date.md)
  have `domains` of the correct type so that they can be transformed
  without error ([\#298](https://github.com/r-lib/scales/issues/298)).

- Internal `precision()`, used when `accuracy = NULL`, now avoids
  displaying unnecessary digits
  ([@davidchall](https://github.com/davidchall),
  [\#304](https://github.com/r-lib/scales/issues/304)).

## scales 1.1.1

CRAN release: 2020-05-11

- [`breaks_width()`](https://scales.r-lib.org/dev/reference/breaks_width.md)
  now handles `difftime`/`hms` objects
  ([@bhogan-mitre](https://github.com/bhogan-mitre),
  [\#244](https://github.com/r-lib/scales/issues/244)).

- [`hue_pal()`](https://scales.r-lib.org/dev/reference/pal_hue.md) now
  correctly inverts color palettes when `direction = -1`
  ([@dpseidel](https://github.com/dpseidel),
  [\#252](https://github.com/r-lib/scales/issues/252)).

- Internal `precision()`, used when `accuracy = NULL`, now does a better
  job when duplicate values are present
  ([@teunbrand](https://github.com/teunbrand),
  [\#251](https://github.com/r-lib/scales/issues/251)). It also does a
  better job when there’s a mix of finite and non-finite values
  ([\#257](https://github.com/r-lib/scales/issues/257)).

- New [`oob_keep()`](https://scales.r-lib.org/dev/reference/oob.md) to
  keep data outside range, allowing for zoom-limits when `oob_keep` is
  used as `oob` argument in scales. Existing out of bounds functions
  have been renamed with the `oob_`-prefix to indicate their role
  ([@teunbrand](https://github.com/teunbrand),
  [\#255](https://github.com/r-lib/scales/issues/255)).

- [`ordinal_french()`](https://scales.r-lib.org/dev/reference/label_ordinal.md)
  gains `plural` and `gender` arguments
  ([@stephLH](https://github.com/stephLH),
  [\#256](https://github.com/r-lib/scales/issues/256)).

## scales 1.1.0

CRAN release: 2019-11-18

- Axis breaks and labels have a new naming scheme: functions that
  generate breaks from limits are called `breaks_`; functions that
  generate labels from breaks are called `labels_`
  ([\#226](https://github.com/r-lib/scales/issues/226)).

- All breaks and labels examples have been overhauled to use new
  [`demo_continuous()`](https://scales.r-lib.org/dev/reference/demo_continuous.md),
  [`demo_discrete()`](https://scales.r-lib.org/dev/reference/demo_continuous.md),
  and
  [`demo_log10()`](https://scales.r-lib.org/dev/reference/demo_continuous.md),
  so you can see how to use scales functions with ggplot2.

### Labels

- All label functions preserve names
  ([\#202](https://github.com/r-lib/scales/issues/202)) and keep `NA`s
  as `NA`s instead of trying to convert to `"NA"`
  ([@clauswilke](https://github.com/clauswilke),
  [\#187](https://github.com/r-lib/scales/issues/187)).

- New
  [`label_bytes()`](https://scales.r-lib.org/dev/reference/label_bytes.md)
  replaces
  [`number_bytes_format()`](https://scales.r-lib.org/dev/reference/number_bytes_format.md)
  with a more convenient interface. It takes a single `unit` argument
  which can either be an SI unit (e.g. “kB”), a binary unit
  (e.g. “kIB”), or an automatic unit (either “auto_si” or
  “auto_binary”).

  It always uses “B” as the symbol for bytes
  ([\#174](https://github.com/r-lib/scales/issues/174)), and checks that
  `units` are valid. Additionally, auto units are now used to determine
  the symbol separately for each value
  ([@mikmart](https://github.com/mikmart)):

  ``` r

  label_bytes("auto_binary")(1024^(1:3))
  #> [1] "1 kiB" "1 MiB" "1 GiB"
  ```

- New
  [`label_date_short()`](https://scales.r-lib.org/dev/reference/label_date.md)
  creates labels for a date axis that only show the components of the
  date that have changed since the previous label. For example, if you
  have Jan 10, Jan 20, Jan 30, and Feb 1,
  [`label_date_short()`](https://scales.r-lib.org/dev/reference/label_date.md)
  will use labels Jan 10, 20, 30, Feb 1
  ([\#209](https://github.com/r-lib/scales/issues/209)).

- [`label_dollar()`](https://scales.r-lib.org/dev/reference/dollar_format.md)
  now correctly formats negative numbers as (e.g.) -\$200
  ([\#216](https://github.com/r-lib/scales/issues/216)).

- [`label_math()`](https://scales.r-lib.org/dev/reference/label_parse.md)
  now returns an expression vector, and doesn’t coerce inputs to names.

- [`label_number()`](https://scales.r-lib.org/dev/reference/label_number.md)
  takes `scale` into account when computing `accuracy`, if not supplied.
  This means that
  [`label_percent()`](https://scales.r-lib.org/dev/reference/label_percent.md)
  should have better default accuracy in many cases
  ([\#192](https://github.com/r-lib/scales/issues/192)).

- [`label_number()`](https://scales.r-lib.org/dev/reference/label_number.md)
  now picks the accuracy automatically by default. The underlying
  heuristic has been improved to use the distance between adjacent
  breaks (rather than the total range of the break).

- New
  [`label_number_auto()`](https://scales.r-lib.org/dev/reference/label_number_auto.md)
  automatically picks between
  [`number_format()`](https://scales.r-lib.org/dev/reference/comma.md)
  and
  [`scientific_format()`](https://scales.r-lib.org/dev/reference/scientific_format.md)
  based on the range of the input. It should produce nice output over a
  very wide range of inputs
  ([@paleolimbot](https://github.com/paleolimbot),
  [\#208](https://github.com/r-lib/scales/issues/208)).

- New
  [`label_number_si()`](https://scales.r-lib.org/dev/reference/label_number_si.md)
  formats numeric vectors with limited SI units. Individual values are
  scaled and labelled with abbreviations “K”, “M”, “B”, or “T” dependent
  on magnitude ([@dpseidel](https://github.com/dpseidel),
  [\#83](https://github.com/r-lib/scales/issues/83)).

- [`label_parse()`](https://scales.r-lib.org/dev/reference/label_parse.md)
  now generates an expression object that can be used to display
  formatted labels in ggplot2 ([@agila5](https://github.com/agila5),
  [\#203](https://github.com/r-lib/scales/issues/203)).

- [`label_pvalue()`](https://scales.r-lib.org/dev/reference/label_pvalue.md)
  now reports values close to 1 (as determined by `accuracy`) as (e.g.)
  “\>0.99”. You can control the prefixes used with the new `prefix`
  argument ([\#213](https://github.com/r-lib/scales/issues/213)).

### Breaks

- The built in breaks functions now returns a function that takes both a
  range and a desired number of breaks, making it possible to overwrite
  the defaults number of desired breaks given in the constructor call
  ([@thomasp85](https://github.com/thomasp85)).

- [`breaks_log()`](https://scales.r-lib.org/dev/reference/breaks_log.md)
  has nicer behaviour when there are no finite inputs
  ([\#210](https://github.com/r-lib/scales/issues/210)). It also
  provides usable breaks even with very small ranges
  ([@billdenney](https://github.com/billdenney),
  [\#168](https://github.com/r-lib/scales/issues/168))

- New
  [`breaks_width()`](https://scales.r-lib.org/dev/reference/breaks_width.md)
  which allows you to specify a fixed distance between breaks (along
  with optional offset).

### Transformations

- New
  [`yj_trans()`](https://scales.r-lib.org/dev/reference/transform_yj.md)
  implements the Yeo-Johnson transformation
  ([@zamorarr](https://github.com/zamorarr),
  [\#196](https://github.com/r-lib/scales/issues/196))

- `trans` objects gets methods for
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html) and
  [`lines()`](https://rdrr.io/r/graphics/lines.html), and all numeric
  transformations get an example showing the transformation.

- [`boxcox_trans()`](https://scales.r-lib.org/dev/reference/transform_boxcox.md)
  no longer throws an error when given NA values
  ([@sflippl](https://github.com/sflippl),
  [\#181](https://github.com/r-lib/scales/issues/181)).

### Other bug fixes and minor improvements

- scales now uses the farver package for colour manipulation instead of
  a combination of grDevices and hand-rolled C++ code
  ([\#223](https://github.com/r-lib/scales/issues/223)).

- [`alpha()`](https://scales.r-lib.org/dev/reference/alpha.md) now
  preserves element names ([@wibeasley](https://github.com/wibeasley),
  [\#195](https://github.com/r-lib/scales/issues/195))

- `ContinuousRange` and `DiscreteRange` methods now properly inherit and
  are fully mutable ([@dpseidel](https://github.com/dpseidel)).

- [`col_numeric()`](https://scales.r-lib.org/dev/reference/col_numeric.md),
  [`col_bin()`](https://scales.r-lib.org/dev/reference/col_numeric.md),
  [`col_quantile()`](https://scales.r-lib.org/dev/reference/col_numeric.md),
  and
  [`col_factor()`](https://scales.r-lib.org/dev/reference/col_numeric.md)
  now support viridis colors. Just pass a palette name (`"magma"`,
  `"inferno"`, `"plasma"`, or `"viridis"`) as the `palette` argument
  ([@jcheng5](https://github.com/jcheng5),
  [\#191](https://github.com/r-lib/scales/issues/191)).

- [`col_numeric()`](https://scales.r-lib.org/dev/reference/col_numeric.md),
  [`col_bin()`](https://scales.r-lib.org/dev/reference/col_numeric.md),
  [`col_quantile()`](https://scales.r-lib.org/dev/reference/col_numeric.md),
  and
  [`col_factor()`](https://scales.r-lib.org/dev/reference/col_numeric.md)
  now have a `reverse` parameter, to apply color palettes in the
  opposite of their usual order (i.e. high-to-low instead of
  low-to-high) ([@jcheng5](https://github.com/jcheng5),
  [\#191](https://github.com/r-lib/scales/issues/191)).

- [`col_bin()`](https://scales.r-lib.org/dev/reference/col_numeric.md)
  and
  [`col_quantile()`](https://scales.r-lib.org/dev/reference/col_numeric.md)
  now take a `right` argument, which is passed to
  [`base::cut()`](https://rdrr.io/r/base/cut.html); it indicates whether
  the bin/quantile intervals should be closed on the right (and open on
  the left), or vice versa ([@jcheng5](https://github.com/jcheng5),
  [\#191](https://github.com/r-lib/scales/issues/191)).

- [`col_factor()`](https://scales.r-lib.org/dev/reference/col_numeric.md)
  now tries to avoid interpolating qualitative RColorBrewer palettes.
  Instead, it attempts to assign a palette color to each factor level.
  Interpolation will still be used if there are more factor levels than
  available colors, and a warning will be emitted in that case
  ([@jcheng5](https://github.com/jcheng5),
  [\#191](https://github.com/r-lib/scales/issues/191)).

- [`dichromat_pal()`](https://scales.r-lib.org/dev/reference/pal_dichromat.md)
  documentation now builds without requiring suggested `dichromat`
  package to be installed ([@dpseidel](https://github.com/dpseidel),
  [\#172](https://github.com/r-lib/scales/issues/172)).

- [`date_breaks()`](https://scales.r-lib.org/dev/reference/date_breaks.md)
  now supports subsecond intervals
  ([@dpseidel](https://github.com/dpseidel),
  [\#85](https://github.com/r-lib/scales/issues/85)).

## scales 1.0.0

CRAN release: 2018-08-09

### New Features

#### Formatters

- [`comma_format()`](https://scales.r-lib.org/dev/reference/comma.md),
  [`percent_format()`](https://scales.r-lib.org/dev/reference/percent_format.md)
  and
  [`unit_format()`](https://scales.r-lib.org/dev/reference/unit_format.md)
  gain new arguments: `accuracy`, `scale`, `prefix`, `suffix`,
  `decimal.mark`, `big.mark`
  ([@larmarange](https://github.com/larmarange),
  [\#146](https://github.com/r-lib/scales/issues/146)).

- [`dollar_format()`](https://scales.r-lib.org/dev/reference/dollar_format.md)
  gains new arguments: `accuracy`, `scale`, `decimal.mark`, `trim`
  ([@larmarange](https://github.com/larmarange),
  [\#148](https://github.com/r-lib/scales/issues/148)).

- New
  [`number_bytes_format()`](https://scales.r-lib.org/dev/reference/number_bytes_format.md)
  and
  [`number_bytes()`](https://scales.r-lib.org/dev/reference/number_bytes_format.md)
  format numeric vectors into byte measurements
  ([@hrbrmstr](https://github.com/hrbrmstr),
  [@dpseidel](https://github.com/dpseidel)).

- New
  [`number_format()`](https://scales.r-lib.org/dev/reference/comma.md)
  provides a generic formatter for numbers
  ([@larmarange](https://github.com/larmarange),
  [\#142](https://github.com/r-lib/scales/issues/142)).

- New
  [`pvalue_format()`](https://scales.r-lib.org/dev/reference/pvalue_format.md)
  formats p-values ([@larmarange](https://github.com/larmarange),
  [\#145](https://github.com/r-lib/scales/issues/145)).

- [`ordinal_format()`](https://scales.r-lib.org/dev/reference/ordinal_format.md)
  gains new arguments: `prefix`, `suffix`, `big.mark`, `rules`; rules
  for French and Spanish are also provided
  ([@larmarange](https://github.com/larmarange),
  [\#149](https://github.com/r-lib/scales/issues/149)).

- [`scientific_format()`](https://scales.r-lib.org/dev/reference/scientific_format.md)
  gains new arguments: `scale`, `prefix`, `suffix`, `decimal.mark`,
  `trim` ([@larmarange](https://github.com/larmarange),
  [\#147](https://github.com/r-lib/scales/issues/147)).

- New
  [`time_format()`](https://scales.r-lib.org/dev/reference/date_format.md)
  formats `POSIXt` and `hms` objects
  ([@dpseidel](https://github.com/dpseidel),
  [\#88](https://github.com/r-lib/scales/issues/88)).

#### Transformations & breaks

- [`boxcox_trans()`](https://scales.r-lib.org/dev/reference/transform_boxcox.md)
  is now invertible for `x >= 0` and requires positive values. A new
  argument `offset` allows specification of both type-1 and type-2
  Box-Cox transformations ([@dpseidel](https://github.com/dpseidel),
  [\#103](https://github.com/r-lib/scales/issues/103)).

- [`log_breaks()`](https://scales.r-lib.org/dev/reference/breaks_log.md)
  returns integer multiples of integer powers of base when finer breaks
  are needed ([@ThierryO](https://github.com/ThierryO),
  [\#117](https://github.com/r-lib/scales/issues/117)).

- New function
  [`modulus_trans()`](https://scales.r-lib.org/dev/reference/transform_boxcox.md)
  implements the modulus transformation for positive and negative values
  ([@dpseidel](https://github.com/dpseidel)).

- New
  [`pseudo_log_trans()`](https://scales.r-lib.org/dev/reference/transform_log.md)
  for transforming numerics into a signed logarithmic scale with a
  smooth transition to a linear scale around 0
  ([@lepennec](https://github.com/lepennec),
  [\#106](https://github.com/r-lib/scales/issues/106)).

### Minor bug fixes and improvements

- scales functions now work as expected when it is used inside a for
  loop. In previous package versions if a scales function was used with
  variable custom parameters inside a for loop, some of the parameters
  were not evaluated until the end of the loop, due to how R lazy
  evaluation works ([@zeehio](https://github.com/zeehio),
  [\#81](https://github.com/r-lib/scales/issues/81)).

- [`colour_ramp()`](https://scales.r-lib.org/dev/reference/colour_ramp.md)
  now uses `alpha = TRUE` by default
  ([@clauswilke](https://github.com/clauswilke),
  [\#108](https://github.com/r-lib/scales/issues/108)).

- [`date_breaks()`](https://scales.r-lib.org/dev/reference/date_breaks.md)
  now supports subsecond intervals
  ([@dpseidel](https://github.com/dpseidel),
  [\#85](https://github.com/r-lib/scales/issues/85)).

- Removes `dichromat` and `plyr` dependencies. `dichromat` is now
  suggested ([@dpseidel](https://github.com/dpseidel),
  [\#118](https://github.com/r-lib/scales/issues/118)).

- [`expand_range()`](https://scales.r-lib.org/dev/reference/expand_range.md)
  arguments `mul` and `add` now affect scales with a range of 0
  ([@dpseidel](https://github.com/dpseidel),
  [ggplot2-2281](https://github.com/tidyverse/ggplot2/issues/2281)).

- [`extended_breaks()`](https://scales.r-lib.org/dev/reference/breaks_extended.md)
  now allows user specification of the
  [`labeling::extended()`](https://rdrr.io/pkg/labeling/man/extended.html)
  argument `only.loose` to permit more flexible breaks specification
  ([@dpseidel](https://github.com/dpseidel),
  [\#99](https://github.com/r-lib/scales/issues/99)).

- New [`rescale()`](https://scales.r-lib.org/dev/reference/rescale.md)
  and
  [`rescale_mid()`](https://scales.r-lib.org/dev/reference/rescale_mid.md)
  methods support `dist` objects ([@zeehio](https://github.com/zeehio),
  [\#105](https://github.com/r-lib/scales/issues/105)).

- [`rescale_mid()`](https://scales.r-lib.org/dev/reference/rescale_mid.md)
  now properly handles NAs
  ([@foo-bar-baz-qux](https://github.com/foo-bar-baz-qux),
  [\#104](https://github.com/r-lib/scales/issues/104)).

## scales 0.5.0

CRAN release: 2017-08-24

- New function
  [`regular_minor_breaks()`](https://scales.r-lib.org/dev/reference/regular_minor_breaks.md)
  calculates minor breaks as a property of the transformation
  ([@karawoo](https://github.com/karawoo)).

- Adds
  [`viridis_pal()`](https://scales.r-lib.org/dev/reference/pal_viridis.md)
  for creating palettes with color maps from the viridisLite package
  ([@karawoo](https://github.com/karawoo)).

- Switched from reference classes to R6
  ([\#96](https://github.com/r-lib/scales/issues/96)).

- [`rescale()`](https://scales.r-lib.org/dev/reference/rescale.md) and
  [`rescale_mid()`](https://scales.r-lib.org/dev/reference/rescale_mid.md)
  are now S3 generics, and work with `numeric`, `Date`, `POSIXct`,
  `POSIXlt` and
  [`bit64::integer64`](https://bit64.r-lib.org/reference/bit64-package.html)
  objects ([@zeehio](https://github.com/zeehio),
  [\#74](https://github.com/r-lib/scales/issues/74)).

## scales 0.4.1

CRAN release: 2016-11-09

- [`extended_breaks()`](https://scales.r-lib.org/dev/reference/breaks_extended.md)
  no longer fails on pathological inputs.

- New
  [`hms_trans()`](https://scales.r-lib.org/dev/reference/transform_timespan.md)
  for transforming hms time vectors.

- [`train_discrete()`](https://scales.r-lib.org/dev/reference/train_discrete.md)
  gets a new `na.rm` argument which controls whether `NA`s are preserved
  or dropped.

## scales 0.4.0

CRAN release: 2016-02-26

- Switched from `NEWS` to `NEWS.md`.

- [`manual_pal()`](https://scales.r-lib.org/dev/reference/pal_manual.md)
  produces a warning if n is greater than the number of values in the
  palette ([@jrnold](https://github.com/jrnold),
  [\#68](https://github.com/r-lib/scales/issues/68)).

- `precision(0)` now returns 1, which means `percent(0)` now returns 0%
  ([\#50](https://github.com/r-lib/scales/issues/50)).

- `scale_continuous()` uses a more correct check for numeric values.

- NaN is correctly recognised as a missing value by the gradient
  palettes
  ([ggplot2-1482](https://github.com/tidyverse/ggplot2/issues/1482)).

## scales 0.3.0

CRAN release: 2015-08-25

- [`rescale()`](https://scales.r-lib.org/dev/reference/rescale.md)
  preserves missing values in input when the range of `x` is
  (effectively) 0
  ([ggplot2-985](https://github.com/tidyverse/ggplot2/issues/985)).

- Continuous colour palettes now use
  [`colour_ramp()`](https://scales.r-lib.org/dev/reference/colour_ramp.md)
  instead of
  [`colorRamp()`](https://rdrr.io/r/grDevices/colorRamp.html). This only
  supports interpolation in Lab colour space, but is hundreds of times
  faster.

## scales 0.2.5

CRAN release: 2015-06-12

### Improved formatting functions

- [`date_format()`](https://scales.r-lib.org/dev/reference/date_format.md)
  gains an option to specify time zone
  ([\#51](https://github.com/r-lib/scales/issues/51)).

- [`dollar_format()`](https://scales.r-lib.org/dev/reference/dollar_format.md)
  is now more flexible and can add either prefixes or suffixes for
  different currencies
  ([\#53](https://github.com/r-lib/scales/issues/53)). It gains a
  `negative_parens` argument to show negative values as `($100)` and now
  passes missing values through unchanged
  ([@dougmitarotonda](https://github.com/dougmitarotonda),
  [\#40](https://github.com/r-lib/scales/issues/40)).

- New
  [`ordinal_format()`](https://scales.r-lib.org/dev/reference/ordinal_format.md)
  generates ordinal numbers (1st, 2nd, etc)
  ([@aaronwolen](https://github.com/aaronwolen),
  [\#55](https://github.com/r-lib/scales/issues/55)).

- New
  [`unit_format()`](https://scales.r-lib.org/dev/reference/unit_format.md)
  makes it easier to add units to labels, optionally scaling
  ([@ThierryO](https://github.com/ThierryO),
  [\#46](https://github.com/r-lib/scales/issues/46)).

- New
  [`wrap_format()`](https://scales.r-lib.org/dev/reference/wrap_format.md)
  function to wrap character vectors to a desired width.
  ([@jimhester](https://github.com/jimhester),
  [\#37](https://github.com/r-lib/scales/issues/37)).

### New colour scaling functions

- New color scaling functions
  [`col_numeric()`](https://scales.r-lib.org/dev/reference/col_numeric.md),
  [`col_bin()`](https://scales.r-lib.org/dev/reference/col_numeric.md),
  [`col_quantile()`](https://scales.r-lib.org/dev/reference/col_numeric.md),
  and
  [`col_factor()`](https://scales.r-lib.org/dev/reference/col_numeric.md).
  These functions provide concise ways to map continuous or categorical
  values to color spectra.

- New
  [`colour_ramp()`](https://scales.r-lib.org/dev/reference/colour_ramp.md)
  function for performing color interpolation in the CIELAB color space
  (like `grDevices::colorRamp(space = 'Lab')`, but much faster).

### Other bug fixes and minor improvements

- [`boxcox_trans()`](https://scales.r-lib.org/dev/reference/transform_boxcox.md)
  returns correct value when p is close to zero
  ([\#31](https://github.com/r-lib/scales/issues/31)).

- [`dollar()`](https://scales.r-lib.org/dev/reference/dollar_format.md)
  and
  [`percent()`](https://scales.r-lib.org/dev/reference/percent_format.md)
  both correctly return a zero length string for zero length input
  ([@BrianDiggs](https://github.com/BrianDiggs),
  [\#35](https://github.com/r-lib/scales/issues/35)).

- [`brewer_pal()`](https://scales.r-lib.org/dev/reference/pal_brewer.md)
  gains a `direction` argument to easily invert the order of colours
  ([@jiho](https://github.com/jiho),
  [\#36](https://github.com/r-lib/scales/issues/36)).

- [`show_col()`](https://scales.r-lib.org/dev/reference/show_col.md) has
  additional options to showcase colors better
  ([@jiho](https://github.com/jiho),
  [\#52](https://github.com/r-lib/scales/issues/52)).

- Relaxed tolerance in
  [`zero_range()`](https://scales.r-lib.org/dev/reference/zero_range.md)
  to `.Machine$double.eps * 1000`
  ([\#33](https://github.com/r-lib/scales/issues/33)).

## scales 0.2.4

CRAN release: 2014-04-22

- Eliminate stringr dependency.

- Fix outstanding errors in R CMD check.

## scales 0.2.3

CRAN release: 2012-12-05

- `floor_time()` calls `to_time()`, but that function was moved into a
  function so it was no longer available in the scales namespace. Now
  `floor_time()` has its own copy of that function (Thanks to Stefan
  Novak).

- Color palettes generated by
  [`brewer_pal()`](https://scales.r-lib.org/dev/reference/pal_brewer.md)
  no longer give warnings when fewer than 3 colors are requested
  ([@wch](https://github.com/wch)).

- [`abs_area()`](https://scales.r-lib.org/dev/reference/pal_area.md) and
  [`rescale_max()`](https://scales.r-lib.org/dev/reference/rescale_max.md)
  functions have been added, for scaling the area of points to be
  proportional to their value. These are used by
  [`scale_size_area()`](https://ggplot2.tidyverse.org/reference/scale_size.html)
  in ggplot2.

## scales 0.2.2

CRAN release: 2012-09-04

- [`zero_range()`](https://scales.r-lib.org/dev/reference/zero_range.md)
  has improved behaviour thanks to Brian Diggs.

- [`brewer_pal()`](https://scales.r-lib.org/dev/reference/pal_brewer.md)
  complains if you give it an incorrect palette type. (Fixes
  [\#15](https://github.com/r-lib/scales/issues/15), thanks to
  Jean-Olivier Irisson).

- [`shape_pal()`](https://scales.r-lib.org/dev/reference/pal_shape.md)
  warns if asked for more than 6 values. (Fixes
  [\#16](https://github.com/r-lib/scales/issues/16), thanks to
  Jean-Olivier Irisson).

- [`time_trans()`](https://scales.r-lib.org/dev/reference/transform_time.md)
  gains an optional argument `tz` to specify the time zone to use for
  the times. If not specified, it will be guess from the first input
  with a non-null time zone.

- [`date_trans()`](https://scales.r-lib.org/dev/reference/transform_date.md)
  and
  [`time_trans()`](https://scales.r-lib.org/dev/reference/transform_time.md)
  now check that their inputs are of the correct type. This prevents
  ggplot2 scales from silently giving incorrect outputs when given
  incorrect inputs.

- Change the default breaks algorithm for
  [`cbreaks()`](https://scales.r-lib.org/dev/reference/cbreaks.md) and
  [`trans_new()`](https://scales.r-lib.org/dev/reference/new_transform.md).
  Previously it was
  [`pretty_breaks()`](https://scales.r-lib.org/dev/reference/pretty_breaks.md),
  and now it’s
  [`extended_breaks()`](https://scales.r-lib.org/dev/reference/breaks_extended.md),
  which uses the `extended()` algorithm from the labeling package.

- fixed namespace problem with
  [`fullseq()`](https://scales.r-lib.org/dev/reference/fullseq.md).

## scales 0.2.1

CRAN release: 2012-05-08

- `suppressWarnings` from
  [`train_continuous()`](https://scales.r-lib.org/dev/reference/train_continuous.md)
  so zero-row or all infinite data frames don’t potentially cause
  problems.

- check for zero-length colour in
  [`gradient_n_pal()`](https://scales.r-lib.org/dev/reference/pal_gradient_n.md).

- added
  [`extended_breaks()`](https://scales.r-lib.org/dev/reference/breaks_extended.md)
  which implements an extension to Wilkinson’s labelling approach, as
  implemented in the `labeling` package. This should generally produce
  nicer breaks than
  [`pretty_breaks()`](https://scales.r-lib.org/dev/reference/pretty_breaks.md).

- [`alpha()`](https://scales.r-lib.org/dev/reference/alpha.md) can now
  preserve existing alpha values if
  [`alpha()`](https://scales.r-lib.org/dev/reference/alpha.md) is
  missing.

- [`log_breaks()`](https://scales.r-lib.org/dev/reference/breaks_log.md)
  always gives breaks evenly spaced on the log scale, never evenly
  spaced on the data scale. This will result in really bad breaks for
  some ranges (e.g 0.5-0.6), but you probably shouldn’t be using log
  scales in that situation anyway.

## scales 0.2.0

CRAN release: 2012-02-27

- [`censor()`](https://scales.r-lib.org/dev/reference/oob.md) and
  [`squish()`](https://scales.r-lib.org/dev/reference/oob.md) gain
  `only.finite` argument and default to operating only on finite values.
  This is needed for ggplot2, and reflects the use of Inf and -Inf as
  special values.

- `bounds` functions now `force` evaluation of range to avoid bug with
  S3 method dispatch inside primitive functions (e.g. `[`).

- Simplified algorithm for `discrete_range()` that is robust to
  `stringsAsFactors` global option. Now, the order of a factor will only
  be preserved if the full factor is the first object seen, and all
  subsequent inputs are subsets of the levels of the original factor.

- [`scientific()`](https://scales.r-lib.org/dev/reference/scientific_format.md)
  ensures output is always in scientific format and off the specified
  number of significant digits.
  [`comma()`](https://scales.r-lib.org/dev/reference/comma.md) ensures
  output is never in scientific format (Fixes
  [\#7](https://github.com/r-lib/scales/issues/7)).

- Another tweak to
  [`zero_range()`](https://scales.r-lib.org/dev/reference/zero_range.md)
  to better detect when a range has zero length (Fixes
  [\#6](https://github.com/r-lib/scales/issues/6)).
