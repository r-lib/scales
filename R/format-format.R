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
    ret <- format(x, ..., trim = TRUE, justify = "left")

    # restore NAs from input vector
    ret[is.na(x)] <- NA

    ret
  }
}

