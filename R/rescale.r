#' Rescale numeric vector to have specified minimum and maximum.
#'
#' @param x data to rescale
#' @param to range to scale to
#' @param from range to scale from, defaults to range of data
#' @keywords manip
rescale <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE)) {
  if (zero_range(from) || zero_range(to)) return(rep(mean(to), length(x)))
  
  (x - from[1]) / diff(from) * diff(to) + to[1]
}

#' Rescale numeric vector to have specified minimum, midpoint, and maximum.
rescale_mid <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE), mid = 0) {
  if (zero_range(from) || zero_range(to)) return(rep(mean(to), length(x)))
  
  extent <- 2 * max(abs(from - mid))
  (x - mid) / extent * diff(to) + mean(to)
}

censor <- function(x, range = c(0, 1)) {
  ifelse(x >= range[1] & x <= range[2], x, NA)
}

#' @author Homer Strong <homer.strong@gmail.com>
clip <- function(x, range = c(0, 1)) {
  x[x < range[1]] <- range[1]
  x[x > range[2]] <- range[2]
  x
}
clip_infinite <- function(x, range = c(0, 1)) {
  x[x == -Inf] <- range[1]
  x[x == Inf] <- range[2]
  x
}

# Determine if range of vector is FP 0.
zero_range <- function(x) {
  if (length(x) == 1) return(TRUE)
  x <- x / mean(x)
  isTRUE(all.equal(x[1], x[2]))
}
