# Modify standard R colour in hcl colour space
# Transforms rgb to hcl, sets non-missing arguments and then backtransforms to rgb
#
# @keyword internal
# @examples col2hcl(colors())
col2hcl <- function(colour, h, c, l, alpha = 1) {
  try_require("colorspace")
  
  col <- colorspace::RGB(t(col2rgb(colour)) / 256)
  coords <- colorspace::coords(as(col, "polarLUV"))
  
  if (missing(h)) h <- coords[, "H"]
  if (missing(c)) c <- coords[, "C"]
  if (missing(l)) l <- coords[, "L"]
    
  hcl_colours <- hcl(h, c, l, alpha = alpha) 
  names(hcl_colours) <- names(colour) 
  hcl_colours
}

# Mute standard R colours.
# This produces colours with moderate luminance and saturation.
# 
# @keyword internal
muted <- function(colour, l=30, c=70) col2hcl(colour, l=l, c=c)

# Add a missing colour to a colour palette.
# Convenient method.
# 
# @keyword internal
missing_colour <- function(palette, missing, na.colour) {
  output <- character(length(missing))
  output[which(!missing)] <- palette
  output[which(missing)] <-  na.colour
  output
}