#' Label with mathematical annotations
#'
#' `label_parse()` produces expression from strings by parsing them;
#' `label_math()` constructs expressions by replacing the pronoun `.x`
#' with each string.
#'
#' @inherit label_number return
#' @seealso [plotmath] for the details of mathematical formatting in R.
#' @export
#' @family labels for continuous scales
#' @family labels for discrete scales
#' @examples
#' # Use label_parse() with discrete scales
#' greek <- c("alpha", "beta", "gamma")
#' demo_discrete(greek)
#' demo_discrete(greek, labels = label_parse())
#'
#' # Use label_math() with continuous scales
#' demo_continuous(c(1, 5))
#' demo_continuous(c(1, 5), labels = label_math(alpha[.x]))
#' demo_continuous(c(1, 5), labels = label_math())
label_parse <- function() {
  function(text) {
    parse_safe(as.character(text))
  }
}

#' @rdname label_parse
#' @export
#' @param expr expression to use
#' @param format another format function to apply prior to mathematical
#'   transformation - this makes it easier to use floating point numbers in
#'   mathematical expressions.
label_math <- function(expr = 10^.x, format = force) {
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

#' Superseded interface to `label_parse()`/`label_math()`
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' These functions are kept for backward compatibility; you should switch
#' to [label_parse()]/[label_math()] for new code.
#'
#' @keywords internal
#' @export
#' @inheritParams label_parse
parse_format <- label_parse
#' @rdname parse_format
#' @export
math_format <- label_math


# From ggplot2:::parse_safe
# See https://github.com/tidyverse/ggplot2/issues/2864 for discussion.
parse_safe <- function(text) {
  out <- vector("expression", length(text))
  for (i in seq_along(text)) {
    expr <- parse(text = text[[i]])
    out[[i]] <- if (length(expr) == 0) NA else expr[[1]]
  }
  out
}
