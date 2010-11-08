#' Manual palette (manual)
#'
#' @export
manual_pal <- function(values) {
  function(n) values[seq_len(n)]
}
