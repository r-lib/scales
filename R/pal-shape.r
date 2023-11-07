#' Shape palette (discrete)
#'
#' @param solid should shapes be solid or not?
#' @export
pal_shape <- function(solid = TRUE) {
  force(solid)
  function(n) {
    if (n > 6) {
      cli::cli_warn(c(
        "The shape palette can deal with a maximum of 6 discrete values because more than 6 becomes difficult to discriminate",
        i = "you have requested {n} values. Consider specifying shapes manually if you need that many have them."
      ))
    }

    if (solid) {
      c(16, 17, 15, 3, 7, 8)[seq_len(n)]
    } else {
      c(1, 2, 0, 3, 7, 8)[seq_len(n)]
    }
  }
}

#' @export
#' @rdname pal_shape
shape_pal <- pal_shape
