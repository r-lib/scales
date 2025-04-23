#' Label numbers in decimal format (e.g. 0.12, 1,234)
#'
#' Use `label_number()` to force decimal display of numbers (i.e. don't use
#' [scientific][label_scientific] notation). `label_comma()` is a special case
#' that inserts a comma every three digits.
#'
#' @return
#' All `label_()` functions return a "labelling" function, i.e. a function that
#' takes a vector `x` and returns a character vector of `length(x)` giving a
#' label for each input value.
#'
#' Labelling functions are designed to be used with the `labels` argument of
#' ggplot2 scales. The examples demonstrate their use with x scales, but
#' they work similarly for all scales, including those that generate legends
#' rather than axes.
#'
#' @param accuracy A number to round to. Use (e.g.) `0.01` to show 2 decimal
#'   places of precision. If `NULL`, the default, uses a heuristic that should
#'   ensure breaks have the minimum number of digits needed to show the
#'   difference between adjacent values.
#'
#'   Applied to rescaled data.
#' @param scale A scaling factor: `x` will be multiplied by `scale` before
#'   formatting. This is useful if the underlying data is very small or very
#'   large.
#' @param prefix Additional text to display before the number. The suffix is
#'   applied to absolute value before `style_positive` and `style_negative` are
#'   processed so that `prefix = "$"` will yield (e.g.) `-$1` and `($1)`.
#' @param suffix Additional text to display after the number.
#' @param big.mark Character used between every 3 digits to separate thousands.
#'   The default (`NULL`) retrieves the setting from the
#'   [number options][number_options].
#' @param decimal.mark The character to be used to indicate the numeric
#'   decimal point.  The default (`NULL`) retrieves the setting from the
#'   [number options][number_options].
#' @param style_positive A string that determines the style of positive numbers:
#'
#'   * `"none"` (the default): no change, e.g. `1`.
#'   * `"plus"`: preceded by `+`, e.g. `+1`.
#'   * `"space"`: preceded by a Unicode "figure space", i.e., a space equally
#'     as wide as a number or `+`. Compared to `"none"`, adding a figure space
#'     can ensure numbers remain properly aligned when they are left- or
#'     right-justified.
#'
#'   The default (`NULL`) retrieves the setting from the
#'   [number options][number_options].
#' @param style_negative A string that determines the style of negative numbers:
#'
#'   * `"hyphen"` (the default): preceded by a standard hyphen `-`, e.g. `-1`.
#'   * `"minus"`, uses a proper Unicode minus symbol. This is a typographical
#'      nicety that ensures `-` aligns with the horizontal bar of the
#'      the horizontal bar of `+`.
#'   * `"parens"`, wrapped in parentheses, e.g. `(1)`.
#'
#'   The default (`NULL`) retrieves the setting from the
#'   [number options][number_options].
#' @param scale_cut Named numeric vector that allows you to rescale large
#'   (or small) numbers and add a prefix. Built-in helpers include:
#'   * `cut_short_scale()`: [10^3, 10^6) = K, [10^6, 10^9) = M, [10^9, 10^12) = B, [10^12, Inf) = T.
#'   * `cut_long_scale()`: [10^3, 10^6) = K, [10^6, 10^12) = M, [10^12, 10^18) = B, [10^18, Inf) = T.
#'   * `cut_si(unit)`: uses standard SI units.
#'
#'   If you supply a vector `c(a = 100, b = 1000)`, absolute values in the
#'   range `[0, 100)` will not be rescaled, absolute values in the range `[100, 1000)`
#'   will be divided by 100 and given the suffix "a", and absolute values in
#'   the range `[1000, Inf)` will be divided by 1000 and given the suffix "b".
#'   If the division creates an irrational value (or one with many digits), the
#'   cut value below will be tried to see if it improves the look of the final
#'   label.
#' @param trim Logical, if `FALSE`, values are right-justified to a common
#'   width (see [base::format()]).
#' @param ... Other arguments passed on to [base::format()].
#' @export
#' @examplesIf getRversion() >= "3.5"
#' demo_continuous(c(-1e6, 1e6))
#' demo_continuous(c(-1e6, 1e6), labels = label_number())
#' demo_continuous(c(-1e6, 1e6), labels = label_comma())
#'
#' # Use scale to rescale very small or large numbers to generate
#' # more readable labels
#' demo_continuous(c(0, 1e6), labels = label_number())
#' demo_continuous(c(0, 1e6), labels = label_number(scale = 1 / 1e3))
#' demo_continuous(c(0, 1e-6), labels = label_number())
#' demo_continuous(c(0, 1e-6), labels = label_number(scale = 1e6))
#'
#' #' Use scale_cut to automatically add prefixes for large/small numbers
#' demo_log10(
#'   c(1, 1e9),
#'   breaks = log_breaks(10),
#'   labels = label_number(scale_cut = cut_short_scale())
#' )
#' demo_log10(
#'   c(1, 1e9),
#'   breaks = log_breaks(10),
#'   labels = label_number(scale_cut = cut_si("m"))
#' )
#' demo_log10(
#'   c(1e-9, 1),
#'   breaks = log_breaks(10),
#'   labels = label_number(scale_cut = cut_si("g"))
#' )
#' # use scale and scale_cut when data already uses SI prefix
#' # for example, if data was stored in kg
#' demo_log10(
#'   c(1e-9, 1),
#'   breaks = log_breaks(10),
#'   labels = label_number(scale_cut = cut_si("g"), scale = 1e3)
#' )
#'
#' #' # Use style arguments to vary the appearance of positive and negative numbers
#' demo_continuous(c(-1e3, 1e3), labels = label_number(
#'   style_positive = "plus",
#'   style_negative = "minus"
#' ))
#' demo_continuous(c(-1e3, 1e3), labels = label_number(style_negative = "parens"))
#'
#' # You can use prefix and suffix for other types of display
#' demo_continuous(c(32, 212), labels = label_number(suffix = "\u00b0F"))
#' demo_continuous(c(0, 100), labels = label_number(suffix = "\u00b0C"))
label_number <- function(
  accuracy = NULL,
  scale = 1,
  prefix = "",
  suffix = "",
  big.mark = NULL,
  decimal.mark = NULL,
  style_positive = NULL,
  style_negative = NULL,
  scale_cut = NULL,
  trim = TRUE,
  ...
) {
  force_all(
    accuracy,
    scale,
    prefix,
    suffix,
    big.mark,
    decimal.mark,
    style_positive,
    style_negative,
    scale_cut,
    trim,
    ...
  )
  function(x) {
    number(
      x,
      accuracy = accuracy,
      scale = scale,
      prefix = prefix,
      suffix = suffix,
      big.mark = big.mark,
      decimal.mark = decimal.mark,
      style_positive = style_positive,
      style_negative = style_negative,
      scale_cut = scale_cut,
      trim = trim,
      ...
    )
  }
}


#' @export
#' @rdname label_number
#' @param digits `r lifecycle::badge("deprecated")` Use `accuracy` instead.
label_comma <- function(
  accuracy = NULL,
  scale = 1,
  prefix = "",
  suffix = "",
  big.mark = ",",
  decimal.mark = ".",
  trim = TRUE,
  digits,
  ...
) {
  if (!missing(digits)) {
    lifecycle::deprecate_stop(
      when = "1.0.0",
      what = "label_comma(digits)",
      with = "label_comma(accuracy)"
    )
  }
  number_format(
    accuracy = accuracy,
    scale = scale,
    prefix = prefix,
    suffix = suffix,
    big.mark = big.mark,
    decimal.mark = decimal.mark,
    trim = trim,
    ...
  )
}

#' Superseded interface to `label_number()`/`label_comma()`
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' These functions are kept for backward compatibility; you should switch
#' to [label_number()]/[label_comma()] for new code.
#'
#' @keywords internal
#' @export
#' @inheritParams label_number
#' @param x A numeric vector to format.
comma <- function(
  x,
  accuracy = NULL,
  scale = 1,
  prefix = "",
  suffix = "",
  big.mark = ",",
  decimal.mark = ".",
  trim = TRUE,
  digits,
  ...
) {
  if (!missing(digits)) {
    lifecycle::deprecate_stop(
      when = "1.0.0",
      what = "comma(digits)",
      with = "comma(accuracy)"
    )
  }
  number(
    x = x,
    accuracy = accuracy,
    scale = scale,
    prefix = prefix,
    suffix = suffix,
    big.mark = big.mark,
    decimal.mark = decimal.mark,
    trim = trim,
    ...
  )
}

#' @export
#' @rdname comma
number_format <- label_number

#' @export
#' @rdname comma
comma_format <- label_comma

#' A low-level numeric formatter
#'
#' This function is a low-level helper that powers many of the labelling
#' functions. You should generally not need to call it directly unless you
#' are creating your own labelling function.
#'
#' @keywords internal
#' @export
#' @inheritParams label_number
#' @return A character vector of `length(x)`.
number <- function(
  x,
  accuracy = NULL,
  scale = 1,
  prefix = "",
  suffix = "",
  big.mark = NULL,
  decimal.mark = NULL,
  style_positive = NULL,
  style_negative = NULL,
  scale_cut = NULL,
  trim = TRUE,
  ...
) {
  if (length(x) == 0) {
    return(character())
  }
  big.mark <- big.mark %||% getOption("scales.big.mark", default = " ")
  decimal.mark <- decimal.mark %||%
    getOption("scales.decimal.mark", default = ".")
  style_positive <- style_positive %||%
    getOption("scales.style_positive", default = "none")
  style_negative <- style_negative %||%
    getOption("scales.style_negative", default = "hyphen")

  style_positive <- arg_match(style_positive, c("none", "plus", "space"))
  style_negative <- arg_match(style_negative, c("hyphen", "minus", "parens"))

  if (!is.null(scale_cut)) {
    cut <- scale_cut(
      x,
      breaks = scale_cut,
      scale = scale,
      accuracy = accuracy,
      suffix = suffix
    )

    scale <- cut$scale
    suffix <- cut$suffix
    accuracy <- cut$accuracy
  }

  accuracy <- accuracy %||% precision(x * scale)
  x <- round_any(x, accuracy / scale)
  nsmalls <- -floor(log10(accuracy))
  nsmalls <- pmin(pmax(nsmalls, 0), 20)

  sign <- sign(x)
  sign[is.na(sign)] <- 0
  x <- abs(x)
  x_scaled <- scale * x

  ret <- character(length(x))
  for (nsmall in unique(nsmalls)) {
    idx <- nsmall == nsmalls

    ret[idx] <- format(
      x_scaled[idx],
      big.mark = big.mark,
      decimal.mark = decimal.mark,
      trim = trim,
      nsmall = nsmall,
      scientific = FALSE,
      ...
    )
  }

  ret <- paste0(prefix, ret, suffix)
  ret[is.infinite(x)] <- as.character(x[is.infinite(x)])

  if (style_negative == "hyphen") {
    ret[sign < 0] <- paste0("-", ret[sign < 0])
  } else if (style_negative == "minus") {
    ret[sign < 0] <- paste0("\u2212", ret[sign < 0])
  } else if (style_negative == "parens") {
    ret[sign < 0] <- paste0("(", ret[sign < 0], ")")
  }
  if (style_positive == "plus") {
    ret[sign > 0] <- paste0("+", ret[sign > 0])
  } else if (style_positive == "space") {
    ret[sign > 0] <- paste0("\u2007", ret[sign > 0])
  }

  # restore NAs from input vector
  ret[is.na(x)] <- NA
  names(ret) <- names(x)

  ret
}

#' Number options
#'
#' Control the settings for formatting numbers globally.
#'
#' @inheritParams label_number
#' @param currency.prefix,currency.suffix,currency.decimal.mark,currency.big.mark
#'   Settings for [`label_currency()`] passed on without the `currency.`-prefix.
#' @param ordinal.rules Setting for [`label_ordinal()`] passed on without the
#'   `ordinal.`-prefix.
#'
#' @return The old options invisibly
#' @export
#'
#' @examples
#' # Default number formatting
#' x <- c(0.1, 1, 1000)
#' label_number()(x)
#'
#' # Now again with new options set
#' number_options(style_positive = "plus", decimal.mark = ",")
#' label_number()(x)
#'
#' # The options are the argument names with a 'scales.'-prefix
#' options("scales.style_positive")
#'
#' # Resetting the options to their defaults
#' number_options()
#' label_number()(x)
number_options <- function(
  decimal.mark = ".",
  big.mark = " ",
  style_positive = c("none", "plus", "space"),
  style_negative = c("hyphen", "minus", "parens"),
  currency.prefix = "$",
  currency.suffix = "",
  currency.decimal.mark = decimal.mark,
  currency.big.mark = setdiff(c(".", ","), currency.decimal.mark)[1],
  ordinal.rules = ordinal_english()
) {
  opts <- options(
    scales.decimal.mark = decimal.mark,
    scales.big.mark = big.mark,
    scales.style_positive = arg_match(style_positive),
    scales.style_negative = arg_match(style_negative),
    scales.currency.prefix = currency.prefix,
    scales.currency.suffix = currency.suffix,
    scales.currency.decimal.mark = currency.decimal.mark,
    scales.currency.big.mark = currency.big.mark,
    scales.ordinal.rules = ordinal.rules
  )
  invisible(opts)
}

# Helpers -----------------------------------------------------------------

precision <- function(x) {
  x <- unique(x)
  # ignore NA and Inf/-Inf
  x <- x[is.finite(x)]

  if (length(x) <= 1) {
    return(1)
  }

  smallest_diff <- min(diff(sort(x)))
  if (smallest_diff < sqrt(.Machine$double.eps)) {
    1
  } else {
    precision <- 10^(floor(log10(smallest_diff)) - 1)

    # reduce precision when final digit always 0
    if (all(round(x / precision) %% 10 == 0)) {
      precision <- precision * 10
    }

    # Never return precision bigger than 1
    pmin(precision, 1)
  }
}

# each value of x is assigned a suffix and associated scaling factor
scale_cut <- function(x, breaks, scale = 1, accuracy = NULL, suffix = "") {
  check_object(breaks, is.numeric, "a numeric vector", arg = caller_arg(breaks))
  if (is.null(names(breaks))) {
    cli::cli_abort("{.arg scale_cut} must have names")
  }
  breaks <- sort(breaks, na.last = TRUE)
  if (anyNA(breaks)) {
    cli::cli_abort("{.arg scale_cut} values must not be missing")
  }

  break_suffix <- as.character(cut(
    abs(x * scale),
    breaks = c(unname(breaks), Inf),
    labels = c(names(breaks)),
    right = FALSE
  ))
  break_suffix[is.na(break_suffix)] <- ""

  # See if any of the cuts aren't perfect cuts
  bad_break <- ((x * scale / breaks[break_suffix]) %% 1 != 0) %|% FALSE
  if (any(bad_break)) {
    # If the break below result in a perfect cut, prefer it
    lower_break <- breaks[match(break_suffix[bad_break], names(breaks)) - 1]
    lower_break[lower_break == 0] <- 1 # Avoid choosing a non-existent break
    improved_break <- (x[bad_break] * scale / lower_break) %% 1 == 0
    # Unless the break below is a power of 10 change (1.25 is as good as 1250)
    power10_break <- breaks[break_suffix[bad_break]] / lower_break
    power10_break <- log10(power10_break) %% 1 == 0
    break_suffix[bad_break][
      improved_break & !power10_break
    ] <- names(lower_break[improved_break & !power10_break])
  }

  break_scale <- scale * unname(1 / breaks[break_suffix])
  break_scale[which(break_scale %in% c(Inf, NA))] <- scale

  # exact zero is not scaled, nor are values below lowest break
  break_scale[abs(x) == 0 | is.na(break_scale)] <- 1

  suffix <- paste0(break_suffix, suffix)
  accuracy <- accuracy %||%
    stats::ave(x * break_scale, break_scale, FUN = precision)

  list(
    scale = break_scale,
    suffix = suffix,
    accuracy = accuracy
  )
}

#' #' See [Metric Prefix](https://en.wikipedia.org/wiki/Metric_prefix) on Wikipedia
#' for more details.

#' @export
#' @rdname number
#' @param space Add a space before the scale suffix?
cut_short_scale <- function(space = FALSE) {
  out <- c(0, K = 1e3, M = 1e6, B = 1e9, T = 1e12)
  if (space) {
    names(out) <- paste0(" ", names(out))
  }
  out
}

#' @export
#' @rdname number
cut_long_scale <- function(space = FALSE) {
  out <- c(0, K = 1e3, M = 1e6, B = 1e12, T = 1e18)
  if (space) {
    names(out) <- paste0(" ", names(out))
  }
  out
}

#' @export
#' @rdname number
cut_time_scale <- function(space = FALSE) {
  out <- c(
    0,
    "ns" = 1e-9,
    "us" = 1e-6,
    "ms" = 1e-3,
    "s" = 1,
    "m" = 60,
    "h" = 3600,
    "d" = 24 * 3600,
    "w" = 7 * 24 * 3600
  )
  if (l10n_info()[["UTF-8"]]) {
    names(out)[3] <- "\u03BCs"
  }
  if (space) {
    names(out) <- paste0(" ", names(out))
  }
  out
}

# power-of-ten prefixes used by the International System of Units (SI)
# https://www.bipm.org/en/measurement-units/prefixes.html
#
# note: irregular prefixes (hecto, deca, deci, centi) are not stored
# because they don't commonly appear in scientific usage anymore
si_powers <- c(
  y = -24,
  z = -21,
  a = -18,
  f = -15,
  p = -12,
  n = -9,
  micro = -6,
  m = -3,
  0,
  k = 3,
  M = 6,
  G = 9,
  T = 12,
  P = 15,
  E = 18,
  Z = 21,
  Y = 24
)
# Avoid using UTF8 as symbol
names(si_powers)[si_powers == -6] <- "\u00b5"

#' @export
#' @rdname number
#' @param unit SI unit abbreviation.
cut_si <- function(unit) {
  out <- c(0, 10^si_powers)
  names(out) <- c(paste0(" ", unit), paste0(" ", names(si_powers), unit))
  out
}
