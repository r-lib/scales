#' Comma formatter: format number with commas separating thousands.
#'
#' @param ... other arguments passed on to [format()]
#' @param x a numeric vector to format
#' @return a function with single parameter x, a numeric vector, that
#'   returns a character vector
#' @export
#' @examples
#' comma_format()(c(1, 1e3, 2000, 1e6))
#' comma_format(digits = 9)(c(1, 1e3, 2000, 1e6))
#' comma(c(1, 1e3, 2000, 1e6))
#'
#' # If you're European you can switch . and , with the more general
#' # format_format
#' point <- format_format(big.mark = ".", decimal.mark = ",", scientific = FALSE)
#' point(c(1, 1e3, 2000, 1e6))
#' point(c(1, 1.021, 1000.01))
comma_format <- function(...) {
  force_all(...)
  function(x) comma(x, ...)
}

#' @export
#' @rdname comma_format
comma <- function(x, ...) {
  format(x, ..., big.mark = ",", scientific = FALSE, trim = TRUE)
}

#' Currency formatter: round to nearest cent and display dollar sign.
#'
#' The returned function will format a vector of values as currency.
#' Values are rounded to the nearest cent, and cents are displayed if
#' any of the values has a non-zero cents and the largest value is less
#' than `largest_with_cents` which by default is 100000.
#'
#' @return a function with single parameter x, a numeric vector, that
#'   returns a character vector
#' @param largest_with_cents the value that all values of `x` must
#'   be less than in order for the cents to be displayed
#' @param prefix,suffix Symbols to display before and after amount.
#' @param big.mark Character used between every 3 digits.
#' @param negative_parens Should negative values be shown with parentheses?
#' @param ... Arguments passed on to [dollar()].
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
dollar_format <- function(...) {
  force_all(...)
  function(x) dollar(x, ...)
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
dollar <- function(x, prefix = "$", suffix = "",
                   largest_with_cents = 100000, big.mark = ",",
                   negative_parens = FALSE) {
  if (length(x) == 0) return(character())
  x <- round_any(x, 0.01)
  if (needs_cents(x, largest_with_cents)) {
    nsmall <- 2L
  } else {
    x <- round_any(x, 1)
    nsmall <- 0L
  }

  negative <- !is.na(x) & x < 0
  if (negative_parens) {
    x <- abs(x)
  }

  amount <- format(abs(x),
    nsmall = nsmall, trim = TRUE, big.mark = big.mark,
    scientific = FALSE, digits = 1L,
  )

  if (negative_parens) {
    paste0(ifelse(negative, "(", ""), prefix, amount, suffix, ifelse(negative, ")", ""))
  } else {
    paste0(prefix, ifelse(negative, "-", ""), amount, suffix)
  }
}

#' Percent formatter: multiply by one hundred and display percent sign.
#'
#' @return a function with single parameter x, a numeric vector, that
#'   returns a character vector
#' @param x a numeric vector to format
#' @export
#' @examples
#' percent_format()(runif(10))
#' percent(runif(10))
#' percent(runif(10, 1, 10))
percent_format <- function() {
  function(x) percent(x)
}
#' @export
#' @rdname percent_format
percent <- function(x) {
  if (length(x) == 0) return(character())
  x <- round_any(x, precision(x) / 100)
  paste0(comma(x * 100), "%")
}

#' Scientific formatter.
#'
#' @return a function with single parameter x, a numeric vector, that
#'   returns a character vector
#' @param digits number of significant digits to show
#' @param ... other arguments passed on to [format()]
#' @param x a numeric vector to format
#' @export
#' @examples
#' scientific_format()(1:10)
#' scientific_format()(runif(10))
#' scientific_format(digits = 2)(runif(10))
#' scientific(1:10)
#' scientific(runif(10))
#' scientific(runif(10), digits = 2)
scientific_format <- function(digits = 3, ...) {
  force_all(digits, ...)
  function(x) scientific(x, digits, ...)
}

#' @export
#' @rdname scientific_format
scientific <- function(x, digits = 3, ...) {
  x <- signif(x, digits)
  format(x, trim = TRUE, scientific = TRUE, ...)
}

#' Ordinal formatter: add ordinal suffixes (-st, -nd, -rd, -th) to numbers.
#'
#' @return a function with single paramater x, a numeric vector, that
#'   returns a character vector
#' @param x a numeric vector to format
#' @export
#' @examples
#' ordinal_format()(1:10)
#' ordinal(1:10)
ordinal_format <- function() {
  function(x) ordinal(x)
}

#' @export
#' @rdname ordinal_format
ordinal <- function(x) {
  stopifnot(all(x > 0))

  suffixes <- list(
    st = "(?<!1)1$",
    nd = "(?<!1)2$",
    rd = "(?<!1)3$",
    th = "(?<=1)[123]$",
    th = "[0456789]$"
  )

  out <- utils::stack(lapply(suffixes, grep, x = x, perl = TRUE))
  paste0(comma(x), out$ind[order(out$values)])
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
  force(width)
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
  force(format)

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
  force_all(...)

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
#' @param scale A scaling factor. Useful if the underlying data is on another scale
#' @param sep The separator between the number and the label
#' @param ... Arguments passed on to [format()]
#' @export
#' @examples
#' # labels in kilometer when the raw data are in meter
#' km <- unit_format(unit = "km", scale = 1e-3, digits = 2)
#' km(runif(10) * 1e3)
#'
#' # labels in hectares, raw data in square meters
#' ha <- unit_format(unit = "ha", scale = 1e-4)
#' km(runif(10) * 1e5)
#' @seealso [comma()]
unit_format <- function(unit = "m", scale = 1, sep = " ", ...) {
  force_all(unit, scale, sep, ...)
  function(x) {
    paste(comma(x * scale, ...), unit, sep = sep)
  }
}

#' Formatted dates and times.
#'
#' @param format Date/time format using standard POSIX specification.  See
#'  [strptime()] for possible formats.
#' @param tz a time zone name, see [timezones()]. Defaults
#'  to UTC
#' @export
#' @examples
#' a_time <- ISOdatetime(2012, 1, 1, 11, 30, 0, tz = "UTC")
#' a_date <- as.Date(a_time)
#'
#' date_format()(a_date)
#' date_format(format = "%A")(a_date)
#'
date_format <- function(format = "%Y-%m-%d", tz = "UTC") {
  force_all(format, tz)
  function(x) format(x, format, tz = tz)
}

#' @export
#' @rdname date_format
#' @examples
#' time_format()(a_time)
#' time_format(tz = "Europe/Berlin")(a_time)
#'
#' a_hms <- hms::as.hms(a_time, tz = "UTC")
#' time_format(format = "%H:%M")(a_hms)
time_format <- function(format = "%H:%M:%S", tz = "UTC") {
  force_all(format, tz)
  function(x) {
    if (inherits(x, "POSIXt")) {
      format(x, format = format, tz = tz)
    } else if (inherits(x, "difftime")) {
      format(as.POSIXct(x), format = format, tz = tz)
    } else {
      stop(
        "time_format can't be used with objects of class ", paste(class(x), collapse = "/"),
        ".",
        call. = FALSE
      )
    }
  }
}
