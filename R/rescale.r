# Rescale numeric vector
# Rescale numeric vector to have specified minimum and maximum.
# If vector has length one, it is not rescaled, but is restricted to the range.
#
# @arguments data to rescale
# @arguments range to scale to
# @arguments range to scale from, defaults to range of data
# @arguments should values be clipped to specified range?
# @keyword manip
rescale <- function(x, to=c(0,1), from=range(x, na.rm=TRUE), clip = TRUE) {
  if (length(to) == 1 || abs(to[1] - to[2]) < 1e-6) return(to[1])
  if (length(from) == 1 || abs(from[1] - from[2]) < 1e-6) return(mean(to))

  if (is.factor(x)) {
    warning("Categorical variable automatically converted to continuous", call.=FALSE)
    x <- as.numeric(x)
  }
  scaled <- (x - from[1]) / diff(from) * diff(to) + to[1]

  if (clip) {
    ifelse(!is.finite(scaled) | scaled %inside% to, scaled, NA) 
  } else {
    scaled
  }
}
