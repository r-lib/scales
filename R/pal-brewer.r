#' Color Brewer palette 
#'
#' @param type One of seq (sequential), div (diverging) or qual (qualitative)
#' @param palette If a string, will use that named palette.  If a number, will
#'   index into the list of palettes of appropriate \code{type}
#' @references \url{http://colorbrewer2.org}
#' @export
brewer_palette <- function(type = "seq", palette = 1) {
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
  scale_discete(x, brewer_palette(...))
}