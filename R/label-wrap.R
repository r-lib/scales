#' Label strings by wrapping across multiple lines
#'
#' Uses [strwrap()] to split long labels across multiple lines.
#'
#' @inherit label_number return
#' @param width Number of characters per line.
#' @export
#' @family labels for discrete scales
#' @examples
#' x <- c(
#'   "this is a long label",
#'   "this is another long label",
#'   "this a label this is even longer"
#' )
#' demo_discrete(x)
#' demo_discrete(x, labels = label_wrap(10))
#' demo_discrete(x, labels = label_wrap(20))
label_wrap <- function(width) {
  force(width)
  function(x) {
    unlist(lapply(strwrap(x, width = width, simplify = FALSE), paste0, collapse = "\n"))
  }
}

#' Superseded interface to `label_wrap()`
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' These functions are kept for backward compatibility; you should switch
#' to [label_wrap()] for new code.
#'
#' @keywords internal
#' @export
#' @inheritParams label_wrap
wrap_format <- label_wrap
