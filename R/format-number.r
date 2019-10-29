#' Number formatters
#'
#' @description
#' A set of functions to format numeric values:
#'
#' * `number_format()` and `number()` are generic formatters for numbers.
#' * `comma_format()` and `comma()` format numbers with commas separating
#'   thousands.
#' * `percent_format()` and `percent()` multiply values by one hundred and
#'   display percent sign.
#'
#' All formatters allow you to re-`scale` (multiplicatively), to round to
#' specified `accuracy`, to add custom `suffix` and `prefix` and to specify
#' `decimal.mark` and `big.mark`.
#'
#' @return `*_format()` returns a function with single parameter
#'   `x`, a numeric vector, that returns a character vector.
#' @param x A numeric vector to format.
#' @param accuracy Number to round to. Use (e.g.) `0.01` to show 2 decimal
#'   places of precision. If `NULL`, the default, uses a heuristic that should
#'   ensure breaks have the minimum number of digits needed to show the
#'   difference between adjacent values.
#'
#'   Applied to rescaled data.
#' @param scale A scaling factor: `x` will be multiply by `scale` before
#'   formating (useful if the underlying data is on another scale,
#'   e.g. for computing percentages or thousands).
#' @param prefix,suffix Symbols to display before and after value.
#' @param big.mark Character used between every 3 digits to separate thousands.
#' @param decimal.mark The character to be used to indicate the numeric
#'   decimal point.
#' @param trim Logical, if `FALSE`, values are right-justified to a common
#'   width (see [base::format()]).
#' @param ... Other arguments passed on to [base::format()].
#' @export
#' @examples
#' demo_continuous(c(-1e6, 1e6))
#' # Suppress scientific notation with number_format()
#' demo_continuous(c(-1e6, 1e6), labels = number_format())
#' # Or comma_format()
#' demo_continuous(c(-1e6, 1e6), labels = comma_format())
#'
#' # Display currencies with dollar_format()
#' demo_continuous(c(-1e6, 1e6), labels = dollar_format())
#' demo_continuous(c(-1e6, 1e6), labels = dollar_format(prefix = "\u20ac"))
#' # Rescale using the scale parameter
#' demo_continuous(c(-1e6, 1e6), labels = dollar_format(scale = 1 / 1000))
number_format <- function(accuracy = NULL, scale = 1, prefix = "",
                          suffix = "", big.mark = " ", decimal.mark = ".",
                          trim = TRUE, ...) {
  force_all(
    accuracy,
    scale,
    prefix,
    suffix,
    big.mark,
    decimal.mark,
    trim,
    ...
  )
  function(x) number(
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
}

#' @export
#' @rdname number_format
number <- function(x, accuracy = NULL, scale = 1, prefix = "",
                   suffix = "", big.mark = " ", decimal.mark = ".",
                   trim = TRUE, ...) {
  if (length(x) == 0) return(character())
  accuracy <- accuracy %||% precision(x * scale)
  x <- round_any(x, accuracy / scale)
  nsmall <- -floor(log10(accuracy))
  nsmall <- min(max(nsmall, 0), 20)

  ret <- format(
    scale * x,
    big.mark = big.mark,
    decimal.mark = decimal.mark,
    trim = trim,
    nsmall = nsmall,
    scientific = FALSE,
    ...
  )
  ret <- paste0(prefix, ret, suffix)
  ret[is.infinite(x)] <- as.character(x[is.infinite(x)])

  # restore NAs from input vector
  ret[is.na(x)] <- NA
  names(ret) <- names(x)

  ret
}


#' @export
#' @rdname number_format
#' @param digits Deprecated, use `accuracy` instead.
comma_format <- function(accuracy = NULL, scale = 1, prefix = "",
                         suffix = "", big.mark = ",", decimal.mark = ".",
                         trim = TRUE, digits, ...) {
  if (!missing(digits)) {
    warning(
      "`digits` argument is deprecated, use `accuracy` instead.",
      .call = FALSE
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

#' @export
#' @rdname number_format
comma <- function(x, accuracy = NULL, scale = 1, prefix = "",
                  suffix = "", big.mark = ",", decimal.mark = ".",
                  trim = TRUE, digits, ...) {
  if (!missing(digits)) {
    warning(
      "`digits` argument is deprecated, use `accuracy` instead.",
      .call = FALSE
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

# Helpers -----------------------------------------------------------------

precision <- function(x) {
  # cannot calculate a precision if all values are Inf or NA
  if (all(is.infinite(x) | is.na(x)) || length(x) == 1) {
    return(1)
  }

  smallest_diff <- min(diff(sort(x)))

  if (smallest_diff < sqrt(.Machine$double.eps)) {
    1
  } else if (smallest_diff > 1) {
    # Don't automatically round large numbers
    1
  } else {
    10^(floor(log10(smallest_diff)) - 1)
  }
}
