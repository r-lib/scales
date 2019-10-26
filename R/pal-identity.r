#' Identity palette
#'
#' Leaves values unchanged - useful when the data is already scaled.
#'
#' @export
identity_pal <- function() {
  function(x) x
}
