#' Manual palette (manual).
#'
#' @param values vector of values to be used as a palette.
#' @export
manual_pal <- function(values) {
  function(n) values[seq_len(n)]
}
