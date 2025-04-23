#' Label numbers in log format (10^3, 10^6, etc)
#'
#' `label_log()` and `format_log()` display numbers as base^exponent, using
#' superscript formatting. `label_log()` returns expressions suitable for
#' labelling in scales, whereas `format_log()` returns deparsed text.
#'
#' @inherit label_number return
#' @param x A numeric vector to format
#' @param base Base of logarithm to use
#' @param digits Number of significant digits to show for the exponent. Argument
#'   is passed on to [base::format()].
#' @param signed Should a `+` or `-` be displayed as a prefix? The
#'   default, `NULL`, displays signs if there are zeroes or negative numbers
#'   present.
#' @param ... Passed on to `format()`.
#'
#' @seealso [breaks_log()] for the related breaks algorithm.
#' @export
#' @family labels for log scales
#' @examples
#' demo_log10(c(1, 1e5), labels = label_log())
#' demo_log10(c(1, 1e5), breaks = breaks_log(base = 2), labels = label_log(base = 2))
#' format_log(c(0.1, 1, 10))
label_log <- function(base = 10, digits = 3, signed = NULL) {
  function(x) {
    text <- format_log(x, base = base, signed = signed, digits = digits)
    ret <- parse_safe(text)
    # restore NAs from input vector
    ret[is.na(x)] <- NA
    ret
  }
}

#' @export
#' @rdname label_log
format_log <- function(x, base = 10, signed = NULL, ...) {
  if (length(x) == 0) {
    return(character())
  }
  prefix <- rep("", length(x))
  finites <- x[is.finite(x)]

  signed <- signed %||% any(finites <= 0)
  if (signed) {
    sign <- sign(x)
    prefix[sign == +1] <- "+"
    prefix[sign == -1] <- "-"
    x <- abs(x)
    x[x == 0] <- 1
  }

  exponent <- format(zapsmall(log(x, base = base)), ...)
  text <- paste0(prefix, base, "^", exponent)

  if (signed) {
    text[sign == 0] <- "0"
  }
  text[is.na(x)] <- NA

  text
}
