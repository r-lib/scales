brewer_palette <- function(palette = "Greens", type) {
  pal <- pal_name(palette, type)
  
  function(n) {
    brewer.pal(n, pal)[seq_len(n)]    
  }
}

pal_name <- function(palette, type) {
  if (is.character(palette)) {
    if (!palette %in% RColorBrewer:::namelist) {
      warning("Unknown palette ", palette)
      palette <- "Greens"
    }
    return(palette)
  }
  
  switch(type, 
    div = RColorBrewer:::divlist, 
    qual = RColorBrewer:::quallist, 
    seq = RColorBrewer:::seqlist
  )[palette]  
}

# 
brewer_scale <- function(..., na.colour = "grey50") {
  ContinuousScale$new(brewer_palette(...), na = na.colour)
}

brewer <- function(x, ...) {
  discrete_scale(x, brewer_palette(...))
}