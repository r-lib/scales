# Functions used for producing Rd chunks to reduce duplication in
# documentation

#' Dynamic documentation functions.
#' 
#' @name dyn-doc
#' @keywords internal
NULL

#' @rdname dyn-doc
#' @export
seealso <- function(pattern) {
  require("scales")
  names <- ls("package:scales", pattern = pattern)
  str_c("\\code{\\link{", names, "}}", collapse = ", ")  
}

#' @rdname dyn-doc
#' @export
seealso_trans <- function() seealso("_trans$")

#' @rdname dyn-doc
#' @export
seealso_pal <- function() seealso("_pal$")
