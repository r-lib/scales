#' Label numbers in log format (10^3, 10^6, etc)
#'
#' `label_log()` displays numbers as base^exponent, using superscript formatting.
#'
#' @param base Base of logarithm to use
#' @param digits Number of significant digits to show for the exponent. Argument
#'   is passed on to [base::format()].
#' @inherit label_number return
#' @seealso [breaks_log()] for the related breaks algorithm.
#' @export
#' @family labels for log scales
#' @examples
#' demo_log10(c(1, 1e5), labels = label_log())
#' demo_log10(c(1, 1e5), breaks = breaks_log(base = 2), labels = label_log(base = 2))
label_log <- function(base = 10, digits = 3) {
  function(x) {
    if (length(x) == 0) {
      return(expression())
    }

    exponent <- format(log(x, base = base), digits = digits)
    text <- paste0(base, "^", exponent)
    ret <- parse_safe(text)

    # restore NAs from input vector
    ret[is.na(x)] <- NA

    ret
  }
}
