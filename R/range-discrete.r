# Calculate range for discrete position variables
# This is the equivalent of range for discrete variables 
# 
# @keyword internal
discrete_range <- function(..., drop = FALSE) {
  pieces <- list(...)
  
  all <- unique(unlist(lapply(pieces, clevels, drop = drop)))
  if (is.numeric(all)) {
    all <- all[order(all)]
    all <- as.character(all)
  }
  
  all
}

clevels <- function(x) {
  if (is.null(x)) return(character())
  
  if (is.factor(x)) {
    if (drop) x <- factor(x)
    values <- levels(x)
  } else if (is.numeric(x)) {
    values <- unique(x)
  } else {
    values <- as.character(unique(x)) 
  }
  if (any(is.na(x))) values <- c(values, NA)
  values
}