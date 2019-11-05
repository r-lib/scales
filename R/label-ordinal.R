#' Label ordinal numbers (1st, 2nd, 3rd, etc)
#'
#' Round values to integers and then display as ordinal values (e.g. 1st, 2nd,
#' 3rd). Built-in rules are provided for English, French, and Spanish.
#'
#' @section Old interface:
#' `ordinal()` and `format_ordinal()` are retired; please use `label_ordinal()`
#' instead.
#' @inherit number_format return params
#' @param prefix,suffix Symbols to display before and after value.
#' @param rules Named list of regular expressions, matched in order.
#'   Name gives suffix, and value specifies which numbers to match.
#' @param ... Other arguments passed on to [base::format()].
#' @export
#' @family labels for continuous scales
#' @examples
#' demo_continuous(c(1, 5))
#' demo_continuous(c(1, 5), labels = label_ordinal())
#' demo_continuous(c(1, 5), labels = label_ordinal(rules = ordinal_french()))
#'
#' # The rules are just a set of regular expressions that are applied in turn
#' ordinal_french()
#' ordinal_english()
#'
#' # Note that ordinal rounds values, so you may need to adjust the breaks too
#' demo_continuous(c(1, 10))
#' demo_continuous(c(1, 10), labels = label_ordinal())
#' demo_continuous(c(1, 10),
#'   labels = label_ordinal(),
#'   breaks = breaks_width(2)
#' )
label_ordinal <- function(prefix = "", suffix = "", big.mark = " ",
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
#' @rdname label_ordinal
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
#' @rdname label_ordinal
ordinal_french <- function() {
  list(
    er = "^1$",
    nd = "^2$",
    e = "."
  )
}

#' @export
#' @rdname label_ordinal
ordinal_spanish <- function() {
  stats::setNames(list("."), ".\u00ba")
}

#' @export
#' @rdname label_ordinal
ordinal_format <- label_ordinal

#' @export
#' @rdname label_ordinal
ordinal <- function(x, prefix = "", suffix = "", big.mark = " ",
                    rules = ordinal_english(), ...) {
  na_idx <- is.na(x)
  x <- round(x, digits = 0)
  x[na_idx] <- 1 # replace NAs with dummy value
  out <- utils::stack(lapply(rules, grep, x = x, perl = TRUE))
  out <- out[!duplicated(out$values), ] # only first result should be considered
  ret <- paste0(
    number(
      accuracy = 1,
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
