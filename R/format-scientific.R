
#' Scientific formatter.
#'
#' @return A function with single parameter `x`, a numeric vector, that
#'   returns a character vector.
#' @param digits Number of significant digits to show.
#' @param scale A scaling factor: `x` will be multiply by `scale` before
#'   formating (useful if the underlying data is on another scale,
#'   e.g. for computing percentages or thousands).
#' @param prefix,suffix Symbols to display before and after value.
#' @param decimal.mark The character to be used to indicate the numeric
#'   decimal point.
#' @param trim Logical, if `FALSE`, values are right-justified to a common
#'   width (see [base::format()]).
#' @param ... Other arguments passed on to [base::format()].
#' @param x A numeric vector to format.
#' @export
#' @examples
#' scientific_format()(1:10)
#' scientific_format()(runif(10))
#' scientific_format(digits = 2)(runif(10))
#' scientific(1:10)
#' scientific(runif(10))
#' scientific(runif(10), digits = 2)
#' scientific(12345, suffix = " cells/mL")
scientific_format <- function(digits = 3, scale = 1, prefix = "", suffix = "",
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
#' @rdname scientific_format
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
