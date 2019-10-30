#' Label numbers with scientific notation (e.g. 1e05, 1.5e-02)
#'
#' @section Old interface:
#' `scientific_format()` and `scientific()` are retired; please use
#' `label_scientific()`.
#' @inherit number_format return params
#' @param digits Number of digits to show before exponent.
#' @param prefix,suffix Symbols to display before and after value.
#' @param ... Other arguments passed on to [base::format()].
#' @family labels for continuous scales
#' @family labels for log scales
#' @export
#' @examples
#' demo_continuous(c(1, 10))
#' demo_continuous(c(1, 10), labels = label_scientific())
#' demo_continuous(c(1, 10), labels = label_scientific(digits = 3))
#'
#' demo_log10(c(1, 1e9))
label_scientific <- function(digits = 3, scale = 1, prefix = "", suffix = "",
                             decimal.mark = ".", trim = TRUE, ...) {
  force_all(digits, scale, prefix, suffix, decimal.mark, trim, ...)
  function(x) scientific(
      x,
      digits = digits,
      scale = scale,
      prefix = prefix,
      suffix = suffix,
      decimal.mark = decimal.mark,
      ...
    )
}

#' @export
#' @rdname label_scientific
scientific_format <- label_scientific

#' @export
#' @rdname label_scientific
scientific <- function(x, digits = 3, scale = 1, prefix = "", suffix = "",
                       decimal.mark = ".", trim = TRUE, ...) {
  if (length(x) == 0) return(character())
  x <- signif(x * scale, digits)
  ret <- paste0(
    prefix,
    format(x, decimal.mark = decimal.mark, trim = trim, scientific = TRUE, ...),
    suffix
  )

  # restore NAs from input vector
  ret[is.na(x)] <- NA
  names(ret) <- names(x)

  ret
}
