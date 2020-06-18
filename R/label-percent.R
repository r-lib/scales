#' Label percentages (2.5%, 50%, etc)
#'
#' @section Old interface:
#' `percent()` and `percent_format()` are retired; please use `label_percent()`
#' instead.
#' @inherit number_format return params
#' @param plus logical; if [TRUE], a plus symbol is prefixed to the percentage
#' @export
#' @family labels for continuous scales
#' @examples
#' demo_continuous(c(0, 1))
#' demo_continuous(c(0, 1), labels = label_percent())
#'
#' # Use prefix and suffix to create your own variants
#' french_percent <- label_percent(
#'   decimal.mark = ",",
#'   suffix = " %"
#' )
#' demo_continuous(c(0, .01), labels = french_percent)
#'
#' # Put plus signs on positive values
#' demo_continuous(c(-.50, .50), labels = label_percent())
#' demo_continuous(c(-.50, .50), labels = label_percent(plus = TRUE))
label_percent <- function(accuracy = NULL, scale = 100, prefix = "",
                           suffix = "%", big.mark = " ", decimal.mark = ".",
                           trim = TRUE, plus = FALSE, ...) {


  if (!missing(plus)) {
    stopifnot(is.logical(plus) && length(plus) == 1L)
    if (!missing(prefix) & plus == TRUE)
      warning("`prefix` and `plus = TRUE` both specified; `plus` takes precedence", call. = FALSE)

    if (plus) {
      prefix <- function(x) {
        if (length(x) > 1) return(vapply(x, prefix, character(1)))
        if (!is.na(x) && x > 0) "+" else ""
      }
    }
  }


  number_format(
    accuracy = accuracy,
    scale = scale,
    prefix = prefix,
    suffix = suffix,
    big.mark = big.mark,
    decimal.mark = decimal.mark,
    trim = trim,
    ...
  )
}

#' @export
#' @rdname label_percent
percent_format <- label_percent

#' @export
#' @rdname label_percent
percent <- function(x, accuracy = NULL, scale = 100, prefix = "",
                    suffix = "%", big.mark = " ", decimal.mark = ".",
                    trim = TRUE, plus = FALSE, ...) {

  if (!missing(plus)) {
    stopifnot(is.logical(plus) && length(plus) == 1L)
    if (!missing(prefix) & plus == TRUE)
      warning("`prefix` and `plus = TRUE` both specified; `plus` takes precedence", call. = FALSE)

    if (plus) {
      prefix <- function(x) {
        if (length(x) > 1) return(vapply(x, prefix, character(1)))
        if (!is.na(x) && x > 0) "+" else ""
      }
    }
  }

  number(
    x = x,
    accuracy = accuracy,
    scale = scale,
    prefix = prefix,
    suffix = suffix,
    big.mark = big.mark,
    decimal.mark = decimal.mark,
    trim = trim,
    ...
  )
}
