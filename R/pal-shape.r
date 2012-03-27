#' Shape palette (discrete).
#'
#' @param solid should shapes be solid or not?
#' @export
shape_pal <- function(solid = TRUE) {
  function(n) {
    if (n > 6) {
      warning("The shape palette can deal with a maximum of 6 discrete values because \n  more than 6 becomes difficult to discriminate; but you have ", n, ".\n  Consider specifying shapes manually if you absolutely want them.")
    }
    if (solid) {
      c(16, 17, 15, 3, 7, 8)[seq_len(n)]
    } else {
      c(1, 2, 0, 3, 7, 8)[seq_len(n)]
    }    
  }
}
