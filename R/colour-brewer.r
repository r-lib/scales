brewer <- function(x, limits, palette) {
  
}

brewer_palette <- function(n, palette, na.colour, ) {
  missing <- is.na(.$input_set())
  n <- sum(!missing)
  
  palette <- RColorBrewer::brewer.pal(n, .$pal_name())[1:n]
  missing_colour(palette, missing, .$na.colour)
  
}

output_set <- function(.) {
}

pal_name <- function(.) {
  if (is.character(.$palette)) {
    if (!.$palette %in% RColorBrewer:::namelist) {
      warning("Unknown palette ", .$palette)
      .$palette <- "Greens"
    }
    return(.$palette)
  }
  
  switch(.$type, 
    div = RColorBrewer:::divlist, 
    qual = RColorBrewer:::quallist, 
    seq = RColorBrewer:::seqlist
  )[.$palette]
}

max_levels <- function(.) {
  RColorBrewer:::maxcolors[RColorBrewer:::namelist == .$pal_name()]
}
