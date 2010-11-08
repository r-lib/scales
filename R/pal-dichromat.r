#' Dichromat (colour-blind) palette (discrete)
#'
#' @importFrom dichromat colorschemes
#' @examples
#' dichromat_palette("BluetoOrange.10")(10)
#' dichromat_palette("BluetoOrange.10")(5)
#'
#' # Can use with gradient_n to create a continous gradient
#' cols <- dichromat_palette("DarkRedtoBlue.12")(12)
#' gradient_n_palette(cols)(seq(0, 1, length = 30))
dichromat_palette <- function(name) {
  if (!any(name == names(colorschemes))) {
    stop("Palette name must be one of ", str_c(names(colorschemes), collapse = ", "), call. = FALSE)
  }
  
  pal <- colorschemes[[name]]
  function(n) pal[seq_len(n)]
}