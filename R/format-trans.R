
#' Format labels after transformation.
#'
#' @param trans transformation to apply
#' @param format additional formatter to apply after transformation
#' @return a function with single parameter x, a numeric vector, that
#'    returns a character vector of list of expressions
#' @export
#' @examples
#' tf <- trans_format("log10", scientific_format())
#' tf(10 ^ 1:6)
trans_format <- function(trans, format = scientific_format()) {
  if (is.character(trans)) trans <- match.fun(trans)
  force(format)

  function(x) {
    x <- trans(x)
    format(x)
  }
}
