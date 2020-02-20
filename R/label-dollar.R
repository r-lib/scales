#' Label currencies ($100, $2.50, etc)
#'
#' Format numbers as currency, rounding values to dollars or cents using
#' a convenient heuristic.
#'
#' @section Old interface:
#' `dollar()` and `format_dollar()` are retired; please use `label_dollar()`
#' instead.
#'
#' @inherit number_format return params
#' @param accuracy,largest_with_cents Number to round to. If `NULL`, the default,
#'   values will be rounded to the nearest integer, unless any of the
#'   values has non-zero fractional component (e.g. cents) and the largest
#'   value is less than `largest_with_cents` which by default is 100,000.
#' @param prefix,suffix Symbols to display before and after value.
#' @param negative_parens Display negative using parentheses?
#' @param billion_scale Named list indicating suffixes given to large values
#'   (e.g. thousands, millions, billions, trillions). Name gives suffix, and
#'   value specifies the power-of-ten. The two most common scales are provided
#'   (`billion_short()` and `billion_long()`). If `NULL`, the default, these
#'   suffixes aren't used.
#' @param ... Other arguments passed on to [base::format()].
#' @export
#' @family labels for continuous scales
#' @examples
#' demo_continuous(c(0, 1), labels = label_dollar())
#' demo_continuous(c(1, 100), labels = label_dollar())
#'
#' # Customise currency display with prefix and suffix
#' demo_continuous(c(1, 100), labels = label_dollar(prefix = "USD "))
#' euro <- dollar_format(
#'   prefix = "",
#'   suffix = "\u20ac",
#'   big.mark = ".",
#'   decimal.mark = ","
#' )
#' demo_continuous(c(1000, 1100), labels = euro)
#'
#' # Use negative_parens = TRUE for finance style display
#' demo_continuous(c(-100, 100), labels = label_dollar(negative_parens = TRUE))
#'
#' # In English-speaking world, short scale is most prevalent
#' dollar <- label_dollar(billion_scale = billion_short())
#' demo_log10(c(1, 1e18), breaks = log_breaks(7, 1e3), labels = dollar)
#'
#' # Elsewhere, long scale is often used
#' euro <- label_dollar(prefix = "", suffix = "EUR", billion_scale = billion_long())
#' demo_log10(c(1, 1e18), breaks = log_breaks(7, 1e3), labels = euro)
#'
#' # You can also define a custom billion scale
#' custom_dollar <- label_dollar(billion_scale = c(k = 3, mn = 6, bn = 9, tn = 12))
#' demo_log10(c(1, 1e18), breaks = log_breaks(7, 1e3), labels = custom_dollar)
label_dollar <- function(accuracy = NULL, scale = 1, prefix = "$",
                          suffix = "", big.mark = ",", decimal.mark = ".",
                          trim = TRUE, largest_with_cents = 100000,
                          negative_parens = FALSE, billion_scale = NULL,
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
    billion_scale,
    ...
  )
  function(x) dollar(
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
      billion_scale = billion_scale,
      ...
    )
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

#' @export
#' @rdname label_dollar
dollar_format <- label_dollar

#' @export
#' @rdname label_dollar
#' @param x A numeric vector
dollar <- function(x, accuracy = NULL, scale = 1, prefix = "$",
                   suffix = "", big.mark = ",", decimal.mark = ".",
                   trim = TRUE, largest_with_cents = 100000,
                   negative_parens = FALSE, billion_scale = NULL,
                   ...) {
  if (length(x) == 0) return(character())
  if (is.null(accuracy)) {
    if (needs_cents(x * scale, largest_with_cents)) {
      accuracy <- .01
    } else {
      accuracy <- 1
    }
  }
  if (identical(big.mark, ",") & identical(decimal.mark, ",")) {
    big.mark <- " "
  }

  negative <- !is.na(x) & x < 0
  x <- abs(x)

  if (!is.null(billion_scale)) {
    breaks <- c(0, 10^billion_scale)

    bn_suffix <- cut(abs(x),
      breaks = c(unname(breaks), Inf),
      labels = c(names(breaks)),
      right = FALSE
    )
    bn_suffix[is.na(bn_suffix)] <- ""

    sep <- if (suffix == "") "" else " "
    suffix <- paste0(bn_suffix, sep, suffix)

    scale <- unname(1 / breaks[bn_suffix])
    # for handling Inf and 0-1 correctly
    scale[which(scale %in% c(Inf, NA))] <- 1
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
    ...
  )

  if (negative_parens) {
    amount <- paste0(ifelse(negative, "(", ""), amount, ifelse(negative, ")", ""))
  } else {
    amount <- paste0(ifelse(negative, "-", ""), amount)
  }

  # restore NAs from input vector
  amount[is.na(x)] <- NA
  names(amount) <- names(x)

  amount
}

#' @export
#' @rdname label_dollar
billion_short <- function() {
  c(K = 3, M = 6, B = 9, T = 12)
}

#' @export
#' @rdname label_dollar
billion_long <- function() {
  c(K = 3, M = 6, B = 12, T = 18)
}
