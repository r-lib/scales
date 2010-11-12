#' Comma formatter: format number with commas separating thousands.
#' 
#' @param ... other arguments passed on to \code{\link{format}}
#' @return a function with single paramater x, a numeric vector, that
#'   returns a character vector
#' @export
comma_format <- function(...) {
  function(x) {
    format(x, big.mark = ",", trim = TRUE, scientific = FALSE, ...)    
  }
}

#' Currency formatter: round to nearest cent and display dollar sign.
#' 
#' @return a function with single paramater x, a numeric vector, that
#'   returns a character vector
#' @export
dollar_format <- function() {
  function(x) {
    x <- round_any(x, 0.01)
    nsmall <- if (max(x) < 100) 2 else 0
    str_c("$", comma(x, nsmall = nsmall))    
  }
}

#' Percent formatter: multiply by one hundred and display percent sign.
#' 
#' @return a function with single paramater x, a numeric vector, that
#'   returns a character vector
#' @export
percent_format <- function() {
  function(x) {
    x <- round_any(x, precision(x) / 100)
    str_c(comma(x * 100), "%")    
  }
}

#' Scientific formatter.
#' 
#' @return a function with single paramater x, a numeric vector, that
#'   returns a character vector
#' @export
scientific_format <- function() {
  function(x) {
    format(x, trim = TRUE)    
  }
}

#' Parse a text label to produce expressions for plotmath.
#' 
#' @seealso \code{\link{plotmath}}
#' @return a function with single paramater x, a character vector, that
#'    returns a list of expressions
#' @export
#' @param x character vector to format
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
trans_format <- function(trans, format = force) {
  if (is.character(trans)) trans <- match.fun(trans)
  
  function(x) {
    x <- trans(x)
    format(x)
  }
}

precision <- function(x) {
  10 ^ floor(log10(diff(range(x, na.rm = TRUE))))
}