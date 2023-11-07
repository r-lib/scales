# Functions used for producing Rd chunks to reduce duplication in
# documentation

seealso <- function(pattern) {
  require("scales")
  names <- ls("package:scales", pattern = pattern)
  paste0("\\code{\\link{", names, "}}", collapse = ", ")
}

seealso_transform <- function() seealso("^transform_")

seealso_pal <- function() seealso("^pal_")
