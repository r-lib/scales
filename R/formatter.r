#' Number formatter: a generic formatter for numbers
#'
#' @return \code{number_format} returns a function with single parameter
#' \code{x}, a numeric vector, that returns a character vector
#' @param x a numeric vector to format
#' @param accuracy number to round to, \code{NULL} for automatic guess
#' @param scale a scaling factor (useful if the underlying is on another
#' scale, e.g. for computing percentages or thousands)
#' @param prefix,suffix symbols to display before and after value
#' @param big.mark character used between every 3 digits to separate thousands
#' @param decimal.mark the character to be used to indicate the numeric
#' decimal point
#' @param trim logical, if \code{FALSE}, values are right-justified to a common
#' width (see \code{\link[base]{format}})
#' @param ... other arguments passed on to \code{\link[base]{format}}
#' @export
#' @examples
#' v <- c(12.3, 4, 12345.789, 0.0002)
#' number(v)
#' number(v, big.mark = ",")
#' number(v, accuracy = .001)
#' number(v, accuracy = .001, decimal.mark = ",")
#' number(v, accuracy = .5)
#'
#' my_format <- number_format(big.mark = "'", decimal.mark = ",")
#' my_format(v)
#'
#' # Per mille
#' per_mille <- number_format(scale = 1000,
#'                            suffix = "\u2030",
#'                            accuracy = .1)
#' per_mille(v)
number_format <- function(accuracy = 1, scale = 1, prefix = "",
                          suffix = "", big.mark = " ", decimal.mark = ".",
                          trim = TRUE, ...) {
  function(x) number(
      x, accuracy, scale, prefix,
      suffix, big.mark, decimal.mark,
      trim, ...
    )
}

#' @export
#' @rdname number_format
number <- function(x, accuracy = 1, scale = 1, prefix = "",
                   suffix = "", big.mark = " ", decimal.mark = ".",
                   trim = TRUE, ...) {
  if (length(x) == 0) return(character())
  if (is.null(accuracy)) {
    x <- round_any(x, precision(x) / scale)
    nsmall <- -floor(log10(precision(x)))
  } else {
    x <- round_any(x, accuracy / scale)
    nsmall <- -floor(log10(accuracy))
  }
  nsmall <- min(max(nsmall, 0), 20)
  paste0(
    prefix,
    format(
      scale * x,
      big.mark = big.mark, decimal.mark = decimal.mark,
      trim = trim, nsmall = nsmall, scientific = FALSE, ...
    ),
    suffix
  )
}



#' Comma formatter: format number with commas separating thousands.
#'
#' @param big.mark character used between every 3 digits to separate thousands
#' @param ... other arguments passed on to \code{\link{number_format}}
#' @param x a numeric vector to format
#' @return a function with single parameter x, a numeric vector, that
#'   returns a character vector
#' @export
#' @examples
#' comma_format()(c(1, 1e3, 2000, 1e6))
#' comma_format(accuracy = .1)(c(1, 1e3, 2000, 1e6))
#' comma(c(1, 1e3, 2000, 1e6))
#'
#' # If you're European you can switch . and , with 'big.mark'
#' # and 'decimal.mark' arguments (see number_format)
#' point <- comma_format(big.mark = ".", decimal.mark = ",", accuracy = .01)
#' point(c(1, 1e3, 2000, 1e6))
#' point(c(1, 1.021, 1000.01))
comma_format <- function(big.mark = ",", ...) {
  number_format(big.mark = big.mark, ...)
}

#' @export
#' @rdname comma_format
comma <- function(x, big.mark = ",", ...) {
  number(x, big.mark = big.mark, ...)
}

#' Currency formatter: round to nearest cent and display dollar sign.
#'
#' The returned function will format a vector of values as currency.
#' Values are rounded to the nearest cent, and cents are displayed if
#' any of the values has a non-zero cents and the largest value is less
#' than `largest_with_cents` which by default is 100000. The level of
#' accuracy could be customised with `accuracy`.
#'
#' @return a function with single parameter x, a numeric vector, that
#'   returns a character vector
#' @param largest_with_cents the value that all values of `x` must
#'   be less than in order for the cents to be displayed (not used
#'   if \code{accuracy} is provided)
#' @param prefix,suffix Symbols to display before and after amount.
#' @param big.mark Character used between every 3 digits.
#' @param negative_parens Should negative values be shown with parentheses?
#' @param ... Other arguments passed on to \code{\link{number_format}}.
#' @param accuracy number to round to, if \code{NULL}, \code{x} will be
#' displayed with 0 or 2 digits, depending on \code{largest_with_cents}
#' @param x a numeric vector to format
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
dollar_format <- function(prefix = "$", suffix = "",
                          largest_with_cents = 100000, ..., big.mark = ",",
                          negative_parens = FALSE, accuracy = NULL) {
  function(x) {
    if (length(x) == 0) return(character())
    if (is.null(accuracy)) {
      if (needs_cents(x, largest_with_cents)) {
        accuracy <- .01
      } else {
        accuracy <- 1
      }
    }

    negative <- !is.na(x) & x < 0
    if (negative_parens) {
      x <- abs(x)
    }

    amount <- number(x,
      prefix = prefix, suffix = suffix,
      big.mark = big.mark, accuracy = accuracy, ...
    )

    if (negative_parens) {
      paste0(ifelse(negative, "(", ""), amount, ifelse(negative, ")", ""))
    } else {
      amount
    }
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

#' @export
#' @rdname dollar_format
dollar <- function(x, ...) {
  dollar_format(...)(x)
}

#' Percent formatter: multiply by one hundred and display percent sign.
#'
#' @return a function with single parameter x, a numeric vector, that
#'   returns a character vector
#' @param x a numeric vector to format
#' @param accuracy number to round to
#' @param scale number to multiply by
#' @param prefix,suffix Symbols to display before and after value
#' @param big.mark Character used between every 3 digits.
#' @param ... Other arguments passed on to \code{\link{number_format}}.
#' @export
#' @examples
#' percent_format()(runif(10))
#' percent(runif(10))
#' percent(runif(10, 1, 100))
#' percent(runif(10), accuracy = 1)
#' percent(runif(10), accuracy = .1)
#'
#' # French percentage
#' percent(c(0.012345, 0.12345, 1.2345, 12.345), suffix = " %",
#'        big.mark = " ", decimal.mark = ",", accuracy = .1)
#'
#' # Per mille
#' per_mille <- percent_format(scale = 1000, suffix = "\u2030")
#' per_mille(c(0.0015, 0.0234))
percent_format <- function(accuracy = NULL, scale = 100, prefix = "",
                           suffix = "%", big.mark = ",", ...) {
  number_format(
    accuracy = accuracy, scale = scale, prefix = prefix,
    suffix = suffix, big.mark = big.mark, ...
  )
}

#' @export
#' @rdname percent_format
percent <- function(x, accuracy = NULL, scale = 100, prefix = "",
                    suffix = "%", big.mark = ",", ...) {
  number(
    x,
    accuracy = accuracy, scale = scale, prefix = prefix,
    suffix = suffix, big.mark = big.mark, ...
  )
}

#' Scientific formatter.
#'
#' @return a function with single parameter x, a numeric vector, that
#'   returns a character vector
#' @param digits number of significant digits to show
#' @param prefix,suffix symbols to display before and after value
#' @param trim logical, if \code{FALSE}, values are right-justified to a common
#' width (see \code{\link[base]{format}})
#' @param ... other arguments passed on to \code{\link[base]{format}}
#' @param x a numeric vector to format
#' @export
#' @examples
#' scientific_format()(1:10)
#' scientific_format()(runif(10))
#' scientific_format(digits = 2)(runif(10))
#' scientific(1:10)
#' scientific(runif(10))
#' scientific(runif(10), digits = 2)
scientific_format <- function(digits = 3, prefix = "", suffix = "",
                              trim = TRUE, ...) {
  function(x) scientific(x, digits, prefix, suffix, trim, ...)
}

#' @export
#' @rdname scientific_format
scientific <- function(x, digits = 3, prefix = "", suffix = "",
                       trim = TRUE, ...) {
  if (length(x) == 0) return(character())
  x <- signif(x, digits)
  paste0(prefix, format(x, trim = trim, scientific = TRUE, ...), suffix)
}

#' Ordinal formatter: add ordinal suffixes (-st, -nd, -rd, -th) to numbers.
#'
#' @return a function with single paramater x, a numeric vector, that
#'   returns a character vector
#' @param prefix,suffix Symbols to display before and after value
#' @param big.mark Character used between every 3 digits.
#' @param rules Custom rules for computing ordinal indicators
#' @param ... Other arguments passed on to \code{\link{number_format}},
#' \code{NULL} for English (see examples).
#' @param x a numeric vector to format
#' @export
#' @examples
#' ordinal_format()(1:10)
#' ordinal(1:10)
#'
#' # Custom rules for French
#' french <- list(
#'   er = "^1$",
#'   nd = "^2$",
#'   e = "([0-9]+)[12]$",
#'   e = "[03456789]"
#' )
#' ordinal(1:20, rules = french)

ordinal_format <- function(prefix = "", suffix = "", big.mark = ",",
                           rules = NULL, ...) {
  function(x) ordinal(x, prefix, suffix, big.mark, rules, ...)
}

#' @export
#' @rdname ordinal_format
ordinal <- function(x, prefix = "", suffix = "", big.mark = ",",
                    rules = NULL, ...) {
  stopifnot(all(x > 0))
  if (length(x) == 0) return(character())

  if (is.null(rules)) {
    rules <- list(
      st = "(?<!1)1$",
      nd = "(?<!1)2$",
      rd = "(?<!1)3$",
      th = "(?<=1)[123]$",
      th = "[0456789]$"
    )
  }

  out <- utils::stack(lapply(rules, grep, x = x, perl = TRUE))
  paste0(
    prefix,
    number(x, prefix = "", suffix = "", big.mark = big.mark, ...),
    out$ind[order(out$values)],
    suffix
  )
}

#' Parse a text label to produce expressions for plotmath.
#'
#' @seealso [plotmath()]
#' @return a function with single parameter x, a character vector, that
#'    returns a list of expressions
#' @export
#' @examples
#' parse_format()(c("alpha", "beta", "gamma"))
parse_format <- function() {
  function(x) {
    lapply(as.character(x), function(x) parse(text = x, srcfile = NULL))
  }
}

#' Add arbitrary expression to a label.
#' The symbol that will be replace by the label value is `.x`.
#'
#' @param expr expression to use
#' @param format another format function to apply prior to mathematical
#'   transformation - this makes it easier to use floating point numbers in
#'   mathematical expressions.
#' @return a function with single parameter x, a numeric vector, that
#'    returns a list of expressions
#' @export
#' @seealso [plotmath()]
#' @examples
#' math_format()(1:10)
#' math_format(alpha + frac(1, .x))(1:10)
#' math_format()(runif(10))
#' math_format(format = percent)(runif(10))
math_format <- function(expr = 10^.x, format = force) {
  quoted <- substitute(expr)
  subs <- function(x) {
    do.call("substitute", list(quoted, list(.x = as.name(x))))
  }

  function(x) {
    x <- format(x)
    lapply(x, subs)
  }
}
globalVariables(".x")

#' Wrap text to a specified width, adding newlines for spaces if text exceeds
#' the width
#'
#' @param width value above which to wrap
#' @return Function with single parameter x, a character vector, that
#'    returns a wrapped character vector
#' @export
#' @examples
#' wrap_10 <- wrap_format(10)
#' wrap_10('A long line that needs to be wrapped')
wrap_format <- function(width) {
  function(x) {
    unlist(lapply(strwrap(x, width = width, simplify = FALSE), paste0, collapse = "\n"))
  }
}
#' Format labels after transformation.
#'
#' @param trans transformation to apply
#' @param format additional formatter to apply after transformation
#' @return a function with single parameter x, a numeric vector, that
#'    returns a character vector of list of expressions
#' @export
#' @examples
#' tf <- trans_format("log10", scientific_format())
#' tf(10 ^ 1:6)
trans_format <- function(trans, format = scientific_format()) {
  if (is.character(trans)) trans <- match.fun(trans)

  function(x) {
    x <- trans(x)
    format(x)
  }
}

#' Format with using any arguments to [format()].
#'
#' If the breaks have names, they will be used in preference to formatting
#' the breaks.
#'
#' @param ... other arguments passed on to [format()].
#' @seealso [format()], [format.Date()],
#'   [format.POSIXct()]
#' @export
format_format <- function(...) {
  function(x) {
    if (!is.null(names(x))) return(names(x))
    format(x, ..., trim = TRUE, justify = "left")
  }
}

precision <- function(x) {
  rng <- range(x, na.rm = TRUE)

  span <- if (zero_range(rng)) abs(rng[1]) else diff(rng)
  if (span == 0) {
    return(1)
  }

  10^floor(log10(span))
}

#' Add units to the labels
#'
#' @param unit The units to append
#' @param scale A scaling factor. Useful if the underlying data is
#' on another scale
#' @param sep The separator between the number and the label
#' @param suffix Symbol to display after value
#' @param big.mark Character used between every 3 digits to separate thousands
#' @param ... Arguments passed on to \code{\link{number_format}}
#' @export
#' @examples
#' # labels in kilometer when the raw data are in meter
#' km <- unit_format(unit = "km", scale = 1e-3, digits = 2)
#' km(runif(10) * 1e3)
#'
#' # labels in hectares, raw data in square meters
#' ha <- unit_format(unit = "ha", scale = 1e-4, accuracy = .1)
#' ha(runif(10) * 1e5)
#' @seealso \code{\link{number_format}}
unit_format <- function(unit = "m", scale = 1, sep = " ",
                        suffix = paste0(sep, unit), big.mark = ",", ...) {
  number_format(scale = scale, suffix = suffix,
                big.mark = big.mark, ...)
}
