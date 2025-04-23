#' Label currencies ($100, €2.50, etc)
#'
#' Format numbers as currency, rounding values to monetary or fractional
#' monetary using unit a convenient heuristic.
#'
#' @inherit label_number return params
#' @param accuracy,largest_with_fractional Number to round
#'   to. If `NULL`, the default, values will be rounded to the nearest integer,
#'   unless any of the values has non-zero fractional component (e.g. cents) and
#'   the largest value is less than `largest_with_fractional` which by default
#'   is 100,000.
#' @param prefix,suffix Symbols to display before and after value.
#'
#' @inheritDotParams number
#' @export
#' @family labels for continuous scales
#' @examples
#' demo_continuous(c(0, 1), labels = label_currency())
#' demo_continuous(c(1, 100), labels = label_currency())
#'
#' # Customise currency display with prefix and suffix
#' demo_continuous(c(1, 100), labels = label_currency(prefix = "USD "))
#' yen <- label_currency(
#'   prefix = "¥",
#'   suffix = "",
#'   big.mark = ".",
#'   decimal.mark = ","
#' )
#' demo_continuous(c(1000, 1100), labels = yen)
#'
#' # Use style_negative = "parens" for finance style display
#' demo_continuous(c(-100, 100), labels = label_currency(style_negative = "parens"))
#'
#' # Use scale_cut to use K/M/B where appropriate
#' demo_log10(c(1, 1e16),
#'   breaks = log_breaks(7, 1e3),
#'   labels = label_currency(scale_cut = cut_short_scale())
#' )
#' # cut_short_scale() uses B = one thousand million
#' # cut_long_scale() uses B = one million million
#' demo_log10(c(1, 1e16),
#'   breaks = log_breaks(7, 1e3),
#'   labels = label_currency(scale_cut = cut_long_scale())
#' )
#'
#' # You can also define your own breaks
#' gbp <- label_currency(
#'   prefix = "\u00a3",
#'   scale_cut = c(0, k = 1e3, m = 1e6, bn = 1e9, tn = 1e12)
#' )
#' demo_log10(c(1, 1e12), breaks = log_breaks(5, 1e3), labels = gbp)
label_currency <- function(
  accuracy = NULL,
  scale = 1,
  prefix = NULL,
  suffix = NULL,
  big.mark = NULL,
  decimal.mark = NULL,
  trim = TRUE,
  largest_with_fractional = 100000,
  ...
) {
  force_all(
    accuracy,
    scale,
    prefix,
    suffix,
    big.mark,
    decimal.mark,
    trim,
    largest_with_fractional,
    ...
  )
  function(x) {
    dollar(
      x,
      accuracy = accuracy,
      scale = scale,
      prefix = prefix,
      suffix = suffix,
      big.mark = big.mark,
      decimal.mark = decimal.mark,
      trim = trim,
      largest_with_cents = largest_with_fractional,
      ...
    )
  }
}

needs_cents <- function(x, threshold) {
  if (all(is.na(x))) {
    return(FALSE)
  }

  if (max(abs(x), na.rm = TRUE) > threshold) {
    return(FALSE)
  }

  !all(x == floor(x), na.rm = TRUE)
}

#' Superseded interface to `label_currency()`
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' These functions are kept for backward compatibility; you should switch
#' to [label_currency()] for new code.
#'
#' @keywords internal
#' @export
#' @inheritParams label_currency
#' @param largest_with_cents Like `largest_with_fractional()` in
#'   [label_currency()]
#' @param negative_parens `r lifecycle::badge("deprecated")` Use
#'   `style_negative = "parens"` instead.
dollar_format <- function(
  accuracy = NULL,
  scale = 1,
  prefix = "$",
  suffix = "",
  big.mark = ",",
  decimal.mark = ".",
  trim = TRUE,
  largest_with_cents = 100000,
  negative_parens = deprecated(),
  ...
) {
  force_all(
    accuracy,
    scale,
    prefix,
    suffix,
    big.mark,
    decimal.mark,
    trim,
    largest_with_cents,
    negative_parens,
    ...
  )
  function(x) {
    dollar(
      x,
      accuracy = accuracy,
      scale = scale,
      prefix = prefix,
      suffix = suffix,
      big.mark = big.mark,
      decimal.mark = decimal.mark,
      trim = trim,
      largest_with_cents = largest_with_cents,
      negative_parens = negative_parens,
      ...
    )
  }
}


#' @export
#' @rdname dollar_format
#' @param x A numeric vector
dollar <- function(
  x,
  accuracy = NULL,
  scale = 1,
  prefix = NULL,
  suffix = NULL,
  big.mark = NULL,
  decimal.mark = NULL,
  trim = TRUE,
  largest_with_cents = 100000,
  negative_parens = deprecated(),
  style_negative = c("hyphen", "minus", "parens"),
  scale_cut = NULL,
  ...
) {
  prefix <- prefix %||% getOption("scales.currency.prefix", default = "$")
  suffix <- suffix %||% getOption("scales.currency.suffix", default = "")
  big.mark <- big.mark %||% getOption("scales.currency.big.mark", default = ",")
  decimal.mark <- decimal.mark %||%
    getOption("scales.currency.decimal.mark", default = ".")
  if (length(x) == 0) {
    return(character())
  }
  if (is.null(accuracy) && is.null(scale_cut)) {
    if (needs_cents(x * scale, largest_with_cents)) {
      accuracy <- .01
    } else {
      accuracy <- 1
    }
  }
  if (identical(big.mark, ",") & identical(decimal.mark, ",")) {
    big.mark <- " "
  }

  if (lifecycle::is_present(negative_parens)) {
    lifecycle::deprecate_stop(
      "1.2.0",
      "dollar(negative_parens)",
      "dollar(style_negative)"
    )
  }

  number(
    x,
    accuracy = accuracy,
    scale = scale,
    prefix = prefix,
    suffix = suffix,
    big.mark = big.mark,
    decimal.mark = decimal.mark,
    trim = trim,
    style_negative = style_negative,
    scale_cut = scale_cut,
    ...
  )
}

#' @export
#' @rdname dollar_format
label_dollar <- dollar_format
