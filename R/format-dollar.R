#' Currency formatter: round to nearest cent and display dollar sign.
#'
#' The returned function will format a vector of values as currency.
#' If `accuracy` is not specified, values are rounded to the nearest cent,
#' and cents are displayed if any of the values has a non-zero cents and
#' the largest value is less than `largest_with_cents` which by default
#' is 100,000.
#'
#' @return A function with single parameter `x`, a numeric vector, that
#'   returns a character vector.
#' @param accuracy Number to round to, `NULL` for automatic guess.
#' @param scale A scaling factor: `x` will be multiply by `scale` before
#'   formating (useful to display the data on another scale, e.g. in k$).
#' @param prefix,suffix Symbols to display before and after value.
#' @param big.mark Character used between every 3 digits to separate thousands.
#' @param decimal.mark The character to be used to indicate the numeric
#'   decimal point.
#' @param trim Logical, if `FALSE`, values are right-justified to a common
#'   width (see [base::format()]).
#' @param largest_with_cents The value that all values of `x` must
#'   be less than in order for the cents to be displayed.
#' @param negative_parens Should negative values be shown with parentheses?
#' @param ... Other arguments passed on to [base::format()].
#' @param x A numeric vector to format.
#' @export
#' @examples
#' dollar_format()(c(-100, 0.23, 1.456565, 2e3))
#' dollar_format()(c(1:10 * 10))
#' dollar(c(100, 0.23, 1.456565, 2e3))
#' dollar(c(1:10 * 10))
#' dollar(10^(1:8))
#'
#' usd <- dollar_format(prefix = "USD ")
#' usd(c(100, -100))
#'
#' euro <- dollar_format(prefix = "", suffix = "\u20ac")
#' euro(100)
#'
#' finance <- dollar_format(negative_parens = TRUE)
#' finance(c(-100, 100))
dollar_format <- function(accuracy = NULL, scale = 1, prefix = "$",
                          suffix = "", big.mark = ",", decimal.mark = ".",
                          trim = TRUE, largest_with_cents = 100000,
                          negative_parens = FALSE, ...) {
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
#' @rdname dollar_format
dollar <- function(x, accuracy = NULL, scale = 1, prefix = "$",
                   suffix = "", big.mark = ",", decimal.mark = ".",
                   trim = TRUE, largest_with_cents = 100000,
                   negative_parens = FALSE, ...) {
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
