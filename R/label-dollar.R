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
#' @param rescale_large Named list indicating suffixes given to large values
#'   (e.g. thousands, millions, billions, trillions). Name gives suffix, and
#'   value specifies the power-of-ten. The two most common scales are provided
#'   (`rescale_short_scale()` and `rescale_long_scale()`).
#'   If `NULL`, the default, these suffixes aren't used.
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
#' # In finance the short scale is most prevalent
#' short <- label_dollar(rescale_large = rescale_short_scale())
#' demo_log10(c(1, 1e18), breaks = log_breaks(7, 1e3), labels = short)
#'
#' # In other contexts the long scale might be used
#' long <- label_dollar(prefix = "", rescale_large = rescale_long_scale())
#' demo_log10(c(1, 1e18), breaks = log_breaks(7, 1e3), labels = long)
#'
#' # You can also define a custom naming scheme
#' gbp <- label_dollar(
#'   prefix = "\u00a3",
#'   rescale_large = c(k = 3L, m = 6L, bn = 9L, tn = 12L)
#' )
#' demo_log10(c(1, 1e12), breaks = log_breaks(5, 1e3), labels = gbp)
label_dollar <- function(accuracy = NULL, scale = 1, prefix = "$",
                         suffix = "", big.mark = ",", decimal.mark = ".",
                         trim = TRUE, largest_with_cents = 100000,
                         negative_parens = deprecated(), rescale_large = NULL,
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
    rescale_large,
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
      negative_parens,
      rescale_large = rescale_large,
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
                   negative_parens = deprecated(), rescale_large = NULL,
                   style_negative = c("hyphen", "minus", "parens"),
                   ...) {
  if (length(x) == 0) {
    return(character())
  }
  if (is.null(accuracy) && is.null(rescale_large)) {
    if (needs_cents(x * scale, largest_with_cents)) {
      accuracy <- .01
    } else {
      accuracy <- 1
    }
  }
  if (identical(big.mark, ",") & identical(decimal.mark, ",")) {
    big.mark <- " "
  }

  if (!is.null(rescale_large)) {
    if (!(is.integer(rescale_large) && all(rescale_large > 0))) {
      stop("`rescale_large` must be positive integers.", call. = FALSE)
    }

    rescale <- rescale_by_suffix(x * scale, breaks = c(0, 10^rescale_large))

    sep <- if (suffix == "") "" else " "
    suffix <- paste0(rescale$suffix, sep, suffix)
    scale <- scale * rescale$scale
  }

  if (lifecycle::is_present(negative_parens)) {
    lifecycle::deprecate_warn("1.2.0", "dollar(negative_parens)", "dollar(style_negative)")
    style_negative <- if (negative_parens) "parens" else "minus"
  }

  amount <- number(
    x,
    accuracy = accuracy,
    scale = scale,
    prefix = prefix,
    suffix = suffix,
    big.mark = big.mark,
    decimal.mark = decimal.mark,
    trim = trim,
    style_negative = style_negative,
    ...
  )

  # restore NAs from input vector
  amount[is.na(x)] <- NA
  names(amount) <- names(x)

  amount
}

#' @export
#' @rdname label_dollar
rescale_short_scale <- function() {
  c(K = 3L, M = 6L, B = 9L, T = 12L)
}

#' @export
#' @rdname label_dollar
rescale_long_scale <- function() {
  c(K = 3L, M = 6L, B = 12L, T = 18L)
}
