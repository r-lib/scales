#' Identity palette
#'
#' Leaves values unchanged - useful when the data is already scaled.
#'
#' @export
pal_identity <- function() {
  function(x) x
}


#' @export
#' @rdname pal_identity
identity_pal <- pal_identity
