#' Label with mathematical expressions
#'
#' `parse_format()` produces expression from strings by parsing them;
#' `math_format()` constructs expressions by replacing the pronoun `.x`
#' with each string.
#'
#' @seealso [plotmath] for the details of mathematical formatting in R.
#' @return A function with a single parameter, `x`, that returns an
#'   expression object.
#' @export
#' @examples
#' parse_format()(c("alpha", "beta", "gamma"))
#' parse_format()(1:5)
#'
#' math_format()(1:10)
#' math_format(frac(alpha, .x))(1:10)
#' math_format(format = percent)(runif(10))
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

#' @rdname parse_format
#' @export
#' @param expr expression to use
#' @param format another format function to apply prior to mathematical
#'   transformation - this makes it easier to use floating point numbers in
#'   mathematical expressions.
math_format <- function(expr = 10^.x, format = force) {
  .x <- NULL
  quoted <- substitute(expr)
  subs <- function(x) {
    do.call("substitute", list(quoted, list(.x = x)))
  }

  function(x) {
    x <- format(x)
    ret <- lapply(x, subs)
    ret <- as.expression(ret)

    # restore NAs from input vector
    ret[is.na(x)] <- NA
    names(ret) <- names(x)

    ret
  }
}
