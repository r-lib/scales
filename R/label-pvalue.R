#' Label p-values (e.g. <0.001, 0.25, p >= 0.99)
#'
#' Formatter for p-values, using "<" and ">" for p-values close to 0 and 1.
#'
#' @inherit label_number return params
#' @param prefix A character vector of length 3 giving the prefixes to
#'   put in front of numbers. The default values are `c("p<", "p=", "p>")`
#'   if `add_p` is `TRUE` and `c("<", "", ">")` if `FALSE`.
#' @param add_p Add "p=" before the value?
#' @export
#' @family labels for continuous scales
#' @examples
#' demo_continuous(c(0, 1))
#' demo_continuous(c(0, 1), labels = label_pvalue())
#' demo_continuous(c(0, 1), labels = label_pvalue(accuracy = 0.1))
#' demo_continuous(c(0, 1), labels = label_pvalue(add_p = TRUE))
#'
#' # Or provide your own prefixes
#' prefix <- c("p < ", "p = ", "p > ")
#' demo_continuous(c(0, 1), labels = label_pvalue(prefix = prefix))
label_pvalue <- function(
  accuracy = .001,
  decimal.mark = NULL,
  prefix = NULL,
  add_p = FALSE
) {
  force_all(accuracy, decimal.mark, add_p)
  function(x) {
    pvalue(
      x,
      accuracy = accuracy,
      decimal.mark = decimal.mark,
      prefix = prefix,
      add_p = add_p
    )
  }
}

#' Superseded interface to `label_pvalue()`
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' These functions are kept for backward compatibility; you should switch
#' to [label_pvalue()] for new code.
#'
#' @keywords internal
#' @export
#' @inheritParams label_pvalue
#' @export
pvalue_format <- label_pvalue

#' @rdname pvalue_format
#' @export
pvalue <- function(
  x,
  accuracy = .001,
  decimal.mark = NULL,
  prefix = NULL,
  add_p = FALSE
) {
  decimal.mark <- decimal.mark %||%
    getOption("scales.decimal.mark", default = ".")
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
      cli::cli_abort("{.arg prefix} must be a length 3 character vector")
    }
  }

  out <- paste0(prefix[[2]], out)
  out[x < accuracy] <- paste0(prefix[[1]], below)
  out[x > 1 - accuracy] <- paste0(prefix[[3]], above)
  out[is.na(x)] <- NA
  names(out) <- names(x)

  out
}
