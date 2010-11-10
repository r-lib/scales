#' Comma formatter: format number with commas separating thousands
#' 
#' @param x numeric vector to format
#' @export
comma <- function(x, ...) {
  format(x, big.mark = ",", trim = TRUE, scientific = FALSE, ...)
}

#' Currency formatter: round to nearest cent and display dollar sign
#' 
#' @param x numeric vector to format
#' @export
dollar <- function(x) {
  x <- round_any(x, 0.01)
  nsmall <- if (max(x) < 100) 2 else 0
  paste("$", comma(x, nsmall = nsmall), sep="")
}

#' Percent formatter: multiply by one hundred and display percent sign
#' 
#' @param x numeric vector to format
#' @export
percent <- function(x) {
  x <- round_any(x, precision(x) / 10)
  paste(comma(x * 100), "%", sep="")
}

#' Scientific formatter
#' 
#' @param x numeric vector to format
#' @export
scientific <- function(x) {
  format(x, trim = TRUE)
}

precision <- function(x) {
  10 ^ floor(log10(diff(range(x, na.rm = TRUE))))
}