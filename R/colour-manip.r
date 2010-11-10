#' Modify standard R colour in hcl colour space.
#' Transforms rgb to hcl, sets non-missing arguments and then backtransforms
#' to rgb.
#'
#' @importFrom colorspace RGB
#' @importFrom colorspace coords
#' @export
#' @examples 
#' col2hcl(colors())
col2hcl <- function(colour, h, c, l, alpha = 1) {
  col <- RGB(t(col2rgb(colour)) / 256)
  coords <- coords(as(col, "polarLUV"))
  
  if (missing(h)) h <- coords[, "H"]
  if (missing(c)) c <- coords[, "C"]
  if (missing(l)) l <- coords[, "L"]
    
  hcl_colours <- hcl(h, c, l, alpha = alpha) 
  names(hcl_colours) <- names(colour) 
  hcl_colours
}

#' Mute standard colour.
#' Produces a colours with moderate luminance and saturation.
#' 
#' @export
muted <- function(colour, l=30, c=70) col2hcl(colour, l=l, c=c)
