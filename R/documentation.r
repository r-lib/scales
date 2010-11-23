seealso <- function(pattern) {
  require("scales")
  all <- setdiff(ls("package:scales", pattern = pattern), "new_trans")
  str_c("\\code{\\link{", all, "}}", collapse = ", ")
  
}

seealso_trans <- function() seealso("_trans$")
seealso_pal <- function() seealso("_pal$")
