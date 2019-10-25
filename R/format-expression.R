
#' Parse a label to produce expressions for plotmath.
#'
#' @seealso [plotmath()]
#' @return A function with a single parameter that returns an expression
#' object.
#'
#' @export
#' @examples
#' parse_format()(c("alpha", "beta", "gamma"))
#' parse_format()(1:5)
parse_format <- function() {
  # From ggplot2:::parse_safe
  # See https://github.com/tidyverse/ggplot2/issues/2864 for discussion.
  function(text) {
    text <- as.character(text)

    out <- vector("expression", length(text))
    for (i in seq_along(text)) {
      expr <- parse(text = text[[i]])
      out[[i]] <- if (length(expr) == 0) NA else expr[[1]]
    }
    out
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
  .x <- NULL
  subs <- function(x) {
    do.call("substitute", list(quoted, list(.x = as.name(x))))
  }

  function(x) {
    x <- format(x)
    ret <- lapply(x, subs)

    # restore NAs from input vector
    ret[is.na(x)] <- NA
    names(ret) <- names(x)

    ret
  }
}
