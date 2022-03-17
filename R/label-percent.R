#' Label percentages (2.5%, 50%, etc)
#'
#' @inherit label_number return params
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
label_percent <- function(accuracy = NULL, scale = 100, prefix = "",
                          suffix = "%", big.mark = " ", decimal.mark = ".",
                          trim = TRUE, ...) {
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

#' Superseded interface to `label_percent()`
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' These functions are kept for backward compatibility; you should switch
#' to [label_percent()] for new code.
#'
#' @keywords internal
#' @export
#' @inheritParams label_percent
percent_format <- label_percent

#' @export
#' @rdname percent_format
percent <- function(x, accuracy = NULL, scale = 100, prefix = "",
                    suffix = "%", big.mark = " ", decimal.mark = ".",
                    trim = TRUE, ...) {
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
