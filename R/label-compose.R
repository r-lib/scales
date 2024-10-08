
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
      attr(x, "orig") <- orig
    }
    x[is.na(orig)] <- NA
    names(x) <- names(x) %||% names(orig)
    x
  }
}
