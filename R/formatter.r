#' Comma formatter: format number with commas separating thousands.
#'
#' @param ... other arguments passed on to \code{\link{format}}
#' @param x a numeric vector to format
#' @return a function with single paramater x, a numeric vector, that
#'   returns a character vector
#' @export
#' @examples
#' comma_format()(c(1, 1e3, 2000, 1e6))
#' comma_format(digits = 9)(c(1, 1e3, 2000, 1e6))
#' comma(c(1, 1e3, 2000, 1e6))
comma_format <- function(...) {
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
#' than \code{largest_with_cents} which by default is 100000.
#'
#' @return a function with single paramater x, a numeric vector, that
#'   returns a character vector
#' @param largest_with_cents the value that all values of \code{x} must
#'   be less than in order for the cents to be displayed
#' @param x a numeric vector to format
#' @export
#' @examples
#' dollar_format()(c(100, 0.23, 1.456565, 2e3))
#' dollar_format()(c(1:10 * 10))
#' dollar(c(100, 0.23, 1.456565, 2e3))
#' dollar(c(1:10 * 10))
#' dollar(10^(1:8))
dollar_format <- function(largest_with_cents = 100000) {
  function(x) {
    x <- round_any(x, 0.01)
    if (max(x, na.rm = TRUE) < largest_with_cents &
        !all(x == floor(x), na.rm = TRUE)) {
      nsmall <- 2L
    } else {
      x <- round_any(x, 1)
      nsmall <- 0L
    }
    paste0("$", format(x, nsmall = nsmall, trim = TRUE, big.mark = ",", scientific = FALSE, digits=1L))
  }
}

#' @export
#' @rdname dollar_format
dollar <- dollar_format()

#' Percent formatter: multiply by one hundred and display percent sign.
#'
#' @return a function with single paramater x, a numeric vector, that
#'   returns a character vector
#' @param x a numeric vector to format
#' @export
#' @examples
#' percent_format()(runif(10))
#' percent(runif(10))
#' percent(runif(10, 1, 10))
percent_format <- function() {
  function(x) {
    x <- round_any(x, precision(x) / 100)
    paste0(comma(x * 100), "%")
  }
}
#' @export
#' @rdname percent_format
percent <- percent_format()

#' Scientific formatter.
#'
#' @return a function with single paramater x, a numeric vector, that
#'   returns a character vector
#' @param digits number of significant digits to show
#' @param ... other arguments passed on to \code{\link{format}}
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
  function(x) scientific(x, digits, ...)
}

#' @export
#' @rdname scientific_format
scientific <- function(x, digits = 3, ...) {
  x <- signif(x, digits)
  format(x, trim = TRUE, scientific = TRUE, ...)
}

#' Parse a text label to produce expressions for plotmath.
#'
#' @seealso \code{\link{plotmath}}
#' @return a function with single paramater x, a character vector, that
#'    returns a list of expressions
#' @export
#' @examples
#' parse_format()(c("alpha", "beta", "gamma"))
parse_format <- function() {
  function(x) {
    llply(as.character(x), function(x) parse(text = x, srcfile = NULL))
  }
}

#' Add arbitrary expression to a label.
#' The symbol that will be replace by the label value is \code{.x}.
#'
#' @param expr expression to use
#' @param format another format function to apply prior to mathematical
#'   transformation - this makes it easier to use floating point numbers in
#'   mathematical expressions.
#' @return a function with single paramater x, a numeric vector, that
#'    returns a list of expressions
#' @export
#' @seealso \code{\link{plotmath}}
#' @examples
#' math_format()(1:10)
#' math_format(alpha + frac(1, .x))(1:10)
#' math_format()(runif(10))
#' math_format(format = percent)(runif(10))
math_format <- function(expr = 10 ^ .x, format = force) {
  quoted <- substitute(expr)
  subs <- function(x) {
    do.call("substitute", list(quoted, list(.x = as.name(x))))
  }

  function(x) {
    x <- format(x)
    llply(x, subs)
  }
}
globalVariables(".x")

#' Format labels after transformation.
#'
#' @param trans transformation to apply
#' @param format additional formatter to apply after transformation
#' @return a function with single paramater x, a numeric vector, that
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

#' Format with using any arguments to \code{\link{format}}.
#'
#' If the breaks have names, they will be used in preference to formatting
#' the breaks.
#'
#' @param ... other arguments passed on to \code{\link{format}}.
#' @seealso \code{\link{format}}, \code{\link{format.Date}},
#'   \code{\link{format.POSIXct}}
#' @export
format_format <- function(...) {
  function(x) {
    if (!is.null(names(x))) return(names(x))
    format(x, ..., trim = TRUE, justify = "left")
  }
}

precision <- function(x) {
  rng <- range(x, na.rm = TRUE)

  span <- if (zero_range(rng)) rng[1] else diff(rng)
  10 ^ floor(log10(span))
}
