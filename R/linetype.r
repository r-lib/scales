#' Default line types based on a set supplied by Richard Pearson, University
#' of Manchester
linetype_palette <- function() {
  types <- c("solid", "22", "42", "44", "13", "1343", "73", "2262",
    "12223242", "F282", "F4448444", "224282F2", "F1")

  function(n) {
    types[seq_len(n)]    
  }
}

