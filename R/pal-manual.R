#' Manual palette (discrete)
#'
#' @param values vector of values to be used as a palette.
#' @export
manual_pal <- function(values) {
  force(values)
  function(n) {
    n_values <- length(values)
    if (n > n_values) {
      cli::cli_warn("This manual palette can handle a maximum of {n_values} values. You have supplied {n}")
    }
    unname(values[seq_len(n)])
  }
}
