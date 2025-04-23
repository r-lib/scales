#' Compose two or more label formatters together
#'
#' This labeller provides a general mechanism for composing two or more
#' labellers together.
#'
#' @inherit label_number return
#' @param ... One or more labelling functions. These will be applied to breaks
#'   consecutively.
#'   [Lambda syntax][rlang::as_function] is allowed.
#' @param call A call to display in error messages.
#'
#' @export
#'
#' @examples
#' demo_continuous(
#'   c(-100, 100),
#'   labels = compose_label(abs, number, \(x) paste0(x, " foobar"), toupper)
#' )
#'
#' # Same result
#' demo_continuous(
#'   c(-100, 100),
#'   labels = compose_label(abs, label_number(suffix = " FOOBAR"))
#' )
compose_label <- function(..., call = caller_env()) {
  label_list <- list2(...)
  if (length(label_list) == 0) {
    return(identity)
  }
  label_list <- lapply(label_list, as_function, call = call)

  function(x) {
    if (length(x) == 0) {
      return(character())
    }
    orig <- x
    for (labeller in label_list) {
      x <- labeller(x)
      attr(x, "orig_breaks") <- orig
    }
    x[is.na(orig)] <- NA
    names(x) <- names(x) %||% names(orig)
    x
  }
}
