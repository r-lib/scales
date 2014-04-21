# Functions used for producing Rd chunks to reduce duplication in
# documentation

seealso <- function(pattern) {
  require("scales")
  names <- ls("package:scales", pattern = pattern)
  paste0("\\code{\\link{", names, "}}", collapse = ", ")
}

seealso_trans <- function() seealso("_trans$")

seealso_pal <- function() seealso("_pal$")
