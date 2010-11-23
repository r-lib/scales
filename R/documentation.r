seealso <- function(pattern) {
  require("scales")
  names <- ls("package:scales", pattern = pattern)
  str_c("\\code{\\link{", names, "}}", collapse = ", ")
  
}

seealso_trans <- function() seealso("_trans$")
seealso_pal <- function() seealso("_pal$")
