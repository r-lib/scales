#' Color Brewer palette (discrete).
#'
#' @param type One of seq (sequential), div (diverging) or qual (qualitative)
#' @param palette If a string, will use that named palette.  If a number, will
#'   index into the list of palettes of appropriate \code{type}
#' @references \url{http://colorbrewer2.org}
#' @export
#' @examples
#' show_col(brewer_pal()(10))
#' show_col(brewer_pal("div")(5))
#' show_col(brewer_pal(pal = "Greens")(5))
#'
#' # Can use with gradient_n to create a continous gradient
#' cols <- brewer_pal("div")(5)
#' show_col(gradient_n_pal(cols)(seq(0, 1, length = 30)))
brewer_pal <- function(type = "seq", palette = 1) {
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
    seq = RColorBrewer:::seqlist,
    stop("Unknown palette type. Should be 'div', 'qual' or 'seq'", 
      call. = FALSE)
  )[palette]  
}
