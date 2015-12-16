#' Manual palette (manual).
#'
#' @param values vector of values to be used as a palette.
#' @export
manual_pal <- function(values) {
  function(n) {
    n_values <- length(values)
    if (n > n_values) {
      warning(sprintf(paste("n = %d is greater than the number of values",
                            "in the pallette (%d)", n , n_values)))
    }
    values[seq_len(n)]
  }
}
