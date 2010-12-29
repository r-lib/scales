dim_expand <- function(mul = 0, add = 0, zero_width = 1) {
  function(x) expand_limits(x, mul, add, zero_width)
}

dim_preserve <- function() {
  function(x) x
}

dim_date <- function() {
  
}

dim_discrete <- function() {
  function(x) c(0.5, length(x) + 0.5)
}

#' Expand a range with a multiplicative or additive constant.
#' 
#' @param range range of data, numeric vector of length 2
#' @param mul multiplicative constract
#' @param add additive constant
#' @param distance to use if range has zero width
#' @export
expand_range <- function(range, mul = 0, add = 0, zero_width = 1) {
  if (is.null(range)) return()

  if (zero_range(range)) {
    c(range[1] - zero_width / 2, range[1] + zero_width / 2)
  } else {    
    range + c(-1, 1) * (diff(range) * mul + add)
  }
}
