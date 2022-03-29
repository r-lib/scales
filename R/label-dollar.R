#' Label currencies ($100, $2.50, etc)
#'
#' Format numbers as currency, rounding values to dollars or cents using
#' a convenient heuristic.
#'
#' @inherit label_number return params
#' @param accuracy,largest_with_cents Number to round to. If `NULL`, the default,
#'   values will be rounded to the nearest integer, unless any of the
#'   values has non-zero fractional component (e.g. cents) and the largest
#'   value is less than `largest_with_cents` which by default is 100,000.
#' @param prefix,suffix Symbols to display before and after value.
#' @param negative_parens `r lifecycle::badge("deprecated")` Use
#'   `style_negative = "parens"` instead.
#' @param ... Other arguments passed on to [base::format()].
#' @export
#' @family labels for continuous scales
#' @examples
#' demo_continuous(c(0, 1), labels = label_dollar())
#' demo_continuous(c(1, 100), labels = label_dollar())
#'
#' # Customise currency display with prefix and suffix
#' demo_continuous(c(1, 100), labels = label_dollar(prefix = "USD "))
#' euro <- label_dollar(
#'   prefix = "",
#'   suffix = "\u20ac",
#'   big.mark = ".",
#'   decimal.mark = ","
#' )
#' demo_continuous(c(1000, 1100), labels = euro)
#'
#' # Use negative_parens = TRUE for finance style display
#' demo_continuous(c(-100, 100), labels = label_dollar(style_negative = "parens"))
#'
#' # Use scale_cut to use K/M/B where appropriate
#' demo_log10(c(1, 1e16),
#'   breaks = log_breaks(7, 1e3),
#'   labels = label_dollar(scale_cut = cut_short_scale())
#' )
#' # cut_short_scale() uses B = one thousand million
#' # cut_long_scale() uses B = one million million
#' demo_log10(c(1, 1e16),
#'   breaks = log_breaks(7, 1e3),
#'   labels = label_dollar(scale_cut = cut_long_scale())
#' )
#'
#' # You can also define your own breaks
#' gbp <- label_dollar(
#'   prefix = "\u00a3",
#'   scale_cut = c(0, k = 1e3, m = 1e6, bn = 1e9, tn = 1e12)
#' )
#' demo_log10(c(1, 1e12), breaks = log_breaks(5, 1e3), labels = gbp)
label_dollar <- function(accuracy = NULL, scale = 1, prefix = "$",
                         suffix = "", big.mark = ",", decimal.mark = ".",
                         trim = TRUE, largest_with_cents = 100000,
                         negative_parens = deprecated(),
                         ...) {
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

needs_cents <- function(x, threshold) {
  if (all(is.na(x))) {
    return(FALSE)
  }

  if (max(abs(x), na.rm = TRUE) > threshold) {
    return(FALSE)
  }

  !all(x == floor(x), na.rm = TRUE)
}

#' Superseded interface to `label_dollar()`
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' These functions are kept for backward compatibility; you should switch
#' to [label_dollar()] for new code.
#'
#' @keywords internal
#' @export
#' @inheritParams label_dollar
dollar_format <- label_dollar

#' @export
#' @rdname dollar_format
#' @param x A numeric vector
dollar <- function(x, accuracy = NULL, scale = 1, prefix = "$",
                   suffix = "", big.mark = ",", decimal.mark = ".",
                   trim = TRUE, largest_with_cents = 100000,
                   negative_parens = deprecated(),
                   style_negative = c("hyphen", "minus", "parens"),
                   scale_cut = NULL,
                   ...) {
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
    lifecycle::deprecate_warn("1.2.0", "dollar(negative_parens)", "dollar(style_negative)")
    style_negative <- if (negative_parens) "parens" else "minus"
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
