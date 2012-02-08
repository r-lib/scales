#' Manual palette (manual).
#'
#' @param values vector of values to be used as a palette.
#' @export
manual_pal <- function(values) {
  function(n = NULL, limits = NULL) {
    if (!is.null(limits))
      values[limits]
    else if (!is.null(n))
      values[seq_len(n)]
    else
      stop("Palette needs either n or limits specified.")
  }
}
