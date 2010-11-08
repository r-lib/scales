#' Shape palette (discrete).
#'
#' @export
shape_pal <- function(solid = TRUE) {
  function(n) {
    if (solid) {
      c(16, 17, 15, 3, 7, 8)[seq_len(n)]
    } else {
      c(1, 2, 0, 3, 7, 8)[seq_len(n)]
    }    
  }
}
