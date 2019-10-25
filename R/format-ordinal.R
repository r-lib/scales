
#' Ordinal formatter: add ordinal suffixes (-st, -nd, -rd, -th) to numbers.
#'
#' `ordinal_english()`, `ordinal_french()` and `ordinal_spanish()` provide
#' rules for computing ordinal indicators in English, French and Spanish
#' respectively.
#'
#' @return A function with single parameter `x`, a numeric vector, that
#'   returns a character vector
#' @param x A numeric vector of positive values to format.
#' @param prefix,suffix Symbols to display before and after value.
#' @param big.mark Character used between every 3 digits to separate thousands.
#' @param rules Named list of regular expressions, match in order. Name gives
#'   suffix, and value specifies which numbers to match.
#' @param ... Other arguments passed on to [base::format()].
#' @note
#' Values in `x` will be rounded before formating.
#' @export
#' @examples
#' ordinal_format()(1:10)
#' ordinal(1:10)
#'
#' # Custom rules for French
#' french <- list(
#'   er = "^1$",
#'   nd = "^2$",
#'   e = "."
#' )
#' ordinal(1:20, rules = french)
#'
#' # You can also use directly
#' ordinal(1:20, rules = ordinal_french())
ordinal_format <- function(prefix = "", suffix = "", big.mark = " ",
                           rules = ordinal_english(), ...) {
  force_all(prefix, suffix, big.mark, rules, ...)
  function(x) ordinal(
      x,
      prefix = prefix,
      suffix = suffix,
      big.mark = big.mark,
      rules = rules,
      ...
    )
}

#' @export
#' @rdname ordinal_format
ordinal <- function(x, prefix = "", suffix = "", big.mark = " ",
                    rules = ordinal_english(), ...) {
  na_idx <- is.na(x)
  x <- round(x, digits = 0)
  x[na_idx] <- 1 # replace NAs with dummy value
  out <- utils::stack(lapply(rules, grep, x = x, perl = TRUE))
  out <- out[!duplicated(out$values), ] # only first result should be considered
  ret <- paste0(
    number(
      x,
      prefix = prefix,
      suffix = "",
      big.mark = big.mark,
      ...
    ),
    out$ind[order(out$values)],
    suffix
  )

  # restore NAs from input vector
  ret[na_idx] <- NA
  names(ret) <- names(x)

  ret
}

#' @export
#' @rdname ordinal_format
ordinal_english <- function() {
  list(
    st = "(?<!1)1$",
    nd = "(?<!1)2$",
    rd = "(?<!1)3$",
    th = "(?<=1)[123]$",
    th = "[0456789]$",
    th = "."
  )
}

#' @export
#' @rdname ordinal_format
ordinal_french <- function() {
  list(
    er = "^1$",
    nd = "^2$",
    e = "."
  )
}

#' @export
#' @rdname ordinal_format
ordinal_spanish <- function() {
  list(
    ".\u00ba" = "."
  )
}
