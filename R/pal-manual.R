#' Manual palette (discrete)
#'
#' @param values vector of values to be used as a palette.
#' @inheritParams new_continuous_palette
#' @export
pal_manual <- function(values, type = NULL) {
  force(values)
  fun <- function(n) {
    n_values <- length(values)
    if (n > n_values) {
      cli::cli_warn(
        "This manual palette can handle a maximum of {n_values} values. You have supplied {n}"
      )
    }
    unname(values[seq_len(n)])
  }
  type <- type %||% guess_pal_type(values)
  new_discrete_palette(
    fun,
    type,
    length(values)
  )
}

#' @export
#' @rdname pal_manual
manual_pal <- pal_manual

guess_pal_type <- function(x) {
  if (is.numeric(x)) {
    "numeric"
  } else if (all(is_color(x))) {
    "colour"
  } else {
    typeof(x)
  }
}

is_color <- function(x) {
  # '#' followed by 3,4,6 or 8 hex digits
  grepl("^#(([[:xdigit:]]{2}){3,4}|([[:xdigit:]]){3,4})$", x) |
    x %in% grDevices::colours()
}
