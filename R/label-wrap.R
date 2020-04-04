#' Label strings by wrapping across multiple lines
#'
#' Uses [strwrap()] to split long labels across multiple lines.
#'
#' @section Old interface:
#' `wrap_format()` is retired; please use `label_format()` instead.
#' @inherit number_format return
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

#' @export
#' @rdname label_wrap
wrap_format <- label_wrap
