# Trim non-finite numbers to specified range
trim_infinite <- function(x, range = c(0, 1)) {
  x[x == -Inf] <- range[1]
  x[x == Inf] <- range[2]
  x
}
