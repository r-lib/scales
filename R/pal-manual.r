#' Manual palette (discrete)
#'
#' @param values vector of values to be used as a palette.
#' @export
manual_pal <- function(values) {
  force(values)
  function(n) {
    n_values <- length(values)
    if (n > n_values) {
      warning("This manual palette can handle a maximum of ", n_values,
        " values. You have supplied ", n, ".",
        call. = FALSE
      )
    }
    values[seq_len(n)]
  }
}
