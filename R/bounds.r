#' Rescale numeric vector to have specified minimum and maximum.
#'
#' @param x numeric vector of values to manipulate.
#' @param to output range (numeric vector of length two)
#' @param from input range (numeric vector of length two).  If not given, is
#'   calculated from the range of \code{x}
#' @keywords manip
#' @export
#' @examples
#' rescale(1:100)
#' rescale(runif(50))
#' rescale(1)
rescale <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE)) {
  if (zero_range(from) || zero_range(to)) return(rep(mean(to), length(x)))
  
  (x - from[1]) / diff(from) * diff(to) + to[1]
}

#' Rescale numeric vector to have specified minimum, midpoint, and maximum.
#'
#' @export
#' @param x numeric vector of values to manipulate.
#' @param to output range (numeric vector of length two)
#' @param from input range (numeric vector of length two).  If not given, is
#'   calculated from the range of \code{x}
#' @param mid mid-point of input range
#' @examples
#' rescale_mid(1:100, mid = 50.5)
#' rescale_mid(runif(50), mid = 0.5)
#' rescale_mid(1)
rescale_mid <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE), mid = 0) {
  if (zero_range(from) || zero_range(to)) return(rep(mean(to), length(x)))
  
  extent <- 2 * max(abs(from - mid))
  (x - mid) / extent * diff(to) + mean(to)
}

#' Don't peform rescaling
#'
#' @param x numeric vector of values to manipulate.
#' @param ... all other arguments ignored
#' @export
#' @examples
#' rescale_none(1:100)
rescale_none <- function(x, ...) {
  x
}

#' Censor any values outside of range.
#'
#' @export
#' @param x numeric vector of values to manipulate.
#' @param range numeric vector of length two giving desired output range.
#' @param only.finite if \code{TRUE} (the default), will only modify
#'   finite values.
#' @export
#' @examples
#' censor(c(-1, 0.5, 1, 2, NA))
censor <- function(x, range = c(0, 1), only.finite = TRUE) {
  force(range)
  finite <- if (only.finite) is.finite(x) else TRUE
  x[finite & x < range[1]] <- NA
  x[finite & x > range[2]] <- NA
  x
}

#' Discard any values outside of range.
#'
#' @inheritParams censor
#' @export
#' @examples
#' discard(c(-1, 0.5, 1, 2, NA))
discard <- function(x, range = c(0, 1)) {
  force(range)
  x[x >= range[1] & x <= range[2]]
}

#' Squish values into range.
#'
#' @author Homer Strong <homer.strong@@gmail.com>
#' @inheritParams censor
#' @export
#' @examples
#' squish(c(-1, 0.5, 1, 2, NA))
#' squish(c(-1, 0, 0.5, 1, 2))
squish <- function(x, range = c(0, 1), only.finite = TRUE) {
  force(range)
  finite <- if (only.finite) is.finite(x) else TRUE
  x[finite & x < range[1]] <- range[1]
  x[finite & x > range[2]] <- range[2]
  x
}

#' Squish infinite values to range.
#'
#' @param x numeric vector of values to manipulate.
#' @param range numeric vector of length two giving desired output range.
#' @export
#' @examples
#' squish_infinite(c(-Inf, -1, 0, 1, 2, Inf))
squish_infinite <- function(x, range = c(0, 1)) {
  force(range)
  x[x == -Inf] <- range[1]
  x[x == Inf] <- range[2]
  x
}

#' Expand a range with a multiplicative or additive constant.
#' 
#' @param range range of data, numeric vector of length 2
#' @param mul multiplicative constract
#' @param add additive constant
#' @param zero_width distance to use if range has zero width
#' @export
expand_range <- function(range, mul = 0, add = 0, zero_width = 1) {
  if (is.null(range)) return()

  if (zero_range(range)) {
    c(range[1] - zero_width / 2, range[1] + zero_width / 2)
  } else {    
    range + c(-1, 1) * (diff(range) * mul + add)
  }
}

#' Determine if range of vector is FP 0.
#' 
#' @export
#' @param x numeric range: vector of length 2
zero_range <- function(x) {
  length(x) == 1 || isTRUE(all.equal(x[1] - x[2], 0))
}
