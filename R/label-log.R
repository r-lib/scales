#' Label numbers in log format (10^3, 10^6, etc)
#'
#' `label_log()` displays numbers as base^exponent, using superscript formatting.
#'
#' @param base base of logarithm to use
#' @inherit number_format return
#' @seealso [breaks_log()] for the related breaks algorithm.
#' @export
#' @family labels for log scales
#' @examples
#' demo_log10(c(1, 1e5), labels = label_log())
#' demo_log10(c(1, 1e5), breaks = breaks_log(base = 2), labels = label_log(base = 2))
label_log <- function(base = 10) {
  function(x) {
    text <- paste0(base, "^", log(x, base = base), recycle0 = TRUE)
    ret <- parse_safe(text)

    # restore NAs from input vector
    ret[is.na(x)] <- NA

    ret
  }
}
