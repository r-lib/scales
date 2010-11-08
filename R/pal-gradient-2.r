gradient2_palette <- function(low = muted("red"), mid = "white", high = muted("blue"), space = "Lab") {
  ramp  <- colorRamp(c(low, mid, high), space = space)
  
  function(x) rgb(ramp(x), max = 255)
}

# rng <- .$output_set()  - .$midpoint
# extent <- max(abs(rng))
# 
# domain <- .$input_set()
# x[x < domain[1] | x > domain[2]] <- NA
# 
# x <- x - .$midpoint
# x <- x / extent / 2 + 0.5
# 
# 
# rgb(ramp(x), max = 255)
# 
