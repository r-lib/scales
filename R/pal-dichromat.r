#' Dichromat (colour-blind) palette (discrete)
#'
#' @param name Name of colour palette.  One of:
#'   \Sexpr[results=rd,stage=build]{scales:::dichromat_schemes()}
#' @export
#' @examples
#' if (requireNamespace("dichromat", quietly = TRUE)) {
#'   show_col(pal_dichromat("BluetoOrange.10")(10))
#'   show_col(pal_dichromat("BluetoOrange.10")(5))
#'
#'   # Can use with gradient_n to create a continous gradient
#'   cols <- pal_dichromat("DarkRedtoBlue.12")(12)
#'   show_col(pal_gradient_n(cols)(seq(0, 1, length.out = 30)))
#' }
pal_dichromat <- function(name) {
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

#' @export
#' @rdname pal_dichromat
dichromat_pal <- pal_dichromat


dichromat_schemes <- function() {
  if (requireNamespace("dichromat", quietly = TRUE)) {
    paste0("\\code{", names(dichromat::colorschemes), "}", collapse = ", ")
  }
}
