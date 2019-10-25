#' p-values formatter
#'
#' Formatter for p-values, adding a symbol "<" for small p-values.
#'
#' @return `pvalue_format` returns a function with single parameter
#'   `x`, a numeric vector, that returns a character vector.
#' @param accuracy Number to round to.
#' @param decimal.mark The character to be used to indicate the numeric
#'   decimal point.
#' @param prefix A character vector of length 3 giving the prefixes to
#'   put in front of numbers. The default values are `c("<", "", ">")`
#'   if `add_p` is `TRUE` and `c("p<", "p=", "p>")` if `FALSE`.
#' @param add_p Add "p=" before the value?
#' @param x A numeric vector of p-values.
#' @export
#' @examples
#' p <- c(.995, .50, 0.12, .045, .011, .009, .00002, NA)
#' pvalue(p)
#' pvalue(p, accuracy = .01)
#' pvalue(p, prefix = c("p < ", "p = ", "p > "))
#' pvalue(p, add_p = TRUE)
#'
#' custom_function <- pvalue_format(accuracy = .1, decimal.mark = ",")
#' custom_function(p)
pvalue_format <- function(accuracy = .001, decimal.mark = ".", prefix = NULL, add_p = FALSE) {
  force_all(accuracy, decimal.mark, add_p)
  function(x) pvalue(
      x,
      accuracy = accuracy,
      decimal.mark = decimal.mark,
      prefix = prefix,
      add_p = add_p
    )
}

#' @rdname pvalue_format
#' @export
pvalue <- function(x,
                   accuracy = .001,
                   decimal.mark = ".",
                   prefix = NULL,
                   add_p = FALSE) {

  out <- number(x, accuracy, decimal.mark = decimal.mark)
  below <- number(accuracy, accuracy, decimal.mark = decimal.mark)
  above <- number(1 - accuracy, accuracy, decimal.mark = decimal.mark)

  if (is.null(prefix)) {
    if (add_p) {
      prefix <- c("p<", "p=", "p>")
    } else {
      prefix <- c("<", "", ">")
    }
  } else {
    if (!is.character(prefix) || length(prefix) != 3) {
      stop("`prefix` must be a length 3 character vector", call. = FALSE)
    }
  }

  out <- paste0(prefix[[2]], out)
  out[x < accuracy] <- paste0(prefix[[1]], below)
  out[x > 1 - accuracy] <- paste0(prefix[[3]], above)
  out[is.na(x)] <- NA
  names(out) <- names(x)

  out
}
