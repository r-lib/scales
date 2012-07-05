#' Shape palette (discrete).
#'
#' @param solid should shapes be solid or not?
#' @export
shape_pal <- function(solid = TRUE) {
  function(n) {
    if (n > 6) {
      msg <- paste("The shape palette can deal with a maximum of 6 discrete ", 
        "values because more than 6 becomes difficult to discriminate; ",
        "you have ", n, ". Consider specifying shapes manually. if you ",
        "must have them.", sep = "")
      warning(paste(strwrap(msg), collapse = "\n"), call. = FALSE)
    }
    
    if (solid) {
      c(16, 17, 15, 3, 7, 8)[seq_len(n)]
    } else {
      c(1, 2, 0, 3, 7, 8)[seq_len(n)]
    }    
  }
}
