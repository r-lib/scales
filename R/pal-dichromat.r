#' Dichromat (colour-blind) palette (discrete).
#'
#' @param name Name of colour palette.  One of:
#'   \Sexpr[results=rd,stage=build]{scales:::dichromat_schemes()}
#' @export
#' @examples
#' show_col(dichromat_pal("BluetoOrange.10")(10))
#' show_col(dichromat_pal("BluetoOrange.10")(5))
#'
#' # Can use with gradient_n to create a continous gradient
#' cols <- dichromat_pal("DarkRedtoBlue.12")(12)
#' show_col(gradient_n_pal(cols)(seq(0, 1, length.out = 30)))
dichromat_pal <- function(name) {
  if (!requireNamespace("dichromat", quietly = TRUE)) {
    stop("Package dichromat must be installed for this function to work. Please install it.",
      call. = FALSE
    )
  }

  if (!any(name == names(dichromat::colorschemes))) {
    stop("Palette name must be one of ",
      paste0(names(dichromat::colorschemes), collapse = ", "),
      call. = FALSE
    )
  }

  pal <- dichromat::colorschemes[[name]]
  function(n) pal[seq_len(n)]
}


dichromat_schemes <- function() {
  paste0("\\code{", names(dichromat::colorschemes), "}", collapse = ", ")
}
