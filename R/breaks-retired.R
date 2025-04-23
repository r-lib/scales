#' Regularly spaced dates
#'
#' @description
#' `r lifecycle::badge('superseded')`
#'
#' Use `breaks_width()` instead.
#'
#' @param width an interval specification, one of "sec", "min", "hour",
#'   "day", "week", "month", "year". Can be by an integer and a space, or
#'   followed by "s". Fractional seconds are supported.
#' @keywords internal
#' @export
date_breaks <- function(width = "1 month") {
  force(width)
  function(x) fullseq(x, width)
}

#' Pretty breaks on transformed scale
#'
#' @description
#' `r lifecycle::badge('superseded')`
#'
#' These often do not produce very attractive breaks.
#'
#' @param trans function of single variable, `x`, that given a numeric
#'   vector returns the transformed values
#' @param inv inverse of the transformation function
#' @param n desired number of ticks
#' @param ... other arguments passed on to pretty
#' @keywords internal
#' @export
#' @examples
#' trans_breaks("log10", function(x) 10^x)(c(1, 1e6))
#' trans_breaks("sqrt", function(x) x^2)(c(1, 100))
#' trans_breaks(function(x) 1 / x, function(x) 1 / x)(c(1, 100))
#' trans_breaks(function(x) -x, function(x) -x)(c(1, 100))
trans_breaks <- function(trans, inv, n = 5, ...) {
  trans <- match.fun(trans)
  inv <- match.fun(inv)
  force_all(n, ...)
  n_default <- n
  function(x, n = n_default) {
    inv(pretty(trans(x), n, ...))
  }
}

#' Compute breaks for continuous scale
#'
#' @description
#' `r lifecycle::badge('superseded')`
#'
#' This function wraps up the components needed to go from a continuous range
#' to a set of breaks and labels suitable for display on axes or legends.
#'
#' @param range numeric vector of length 2 giving the range of the underlying
#'   data
#' @param breaks either a vector of break values, or a break function that
#'   will make a vector of breaks when given the range of the data
#' @param labels either a vector of labels (character vector or list of
#'   expression) or a format function that will make a vector of labels when
#'   called with a vector of breaks. Labels can only be specified manually if
#'   breaks are - it is extremely dangerous to supply labels if you don't know
#'   what the breaks will be.
#' @keywords internal
#' @export
#' @examples
#' cbreaks(c(0, 100))
#' cbreaks(c(0, 100), breaks_pretty(3))
#' cbreaks(c(0, 100), breaks_pretty(10))
#' cbreaks(c(1, 100), log_breaks())
#' cbreaks(c(1, 1e4), log_breaks())
#'
#' cbreaks(c(0, 100), labels = math_format())
#' cbreaks(c(0, 1), labels = percent_format())
#' cbreaks(c(0, 1e6), labels = comma_format())
#' cbreaks(c(0, 1e6), labels = dollar_format())
#' cbreaks(c(0, 30), labels = dollar_format())
#'
#' # You can also specify them manually:
#' cbreaks(c(0, 100), breaks = c(15, 20, 80))
#' cbreaks(c(0, 100), breaks = c(15, 20, 80), labels = c(1.5, 2.0, 8.0))
#' cbreaks(c(0, 100),
#'   breaks = c(15, 20, 80),
#'   labels = expression(alpha, beta, gamma)
#' )
cbreaks <- function(
  range,
  breaks = extended_breaks(),
  labels = scientific_format()
) {
  if (zero_range(range)) {
    return(list(breaks = range[1], labels = format(range[1])))
  }

  if (is.function(breaks)) {
    breaks <- breaks(range)

    if (!is.function(labels)) {
      cli::cli_abort(
        "{.arg labels} can only be manually specified in conjunction with {.arg breaks}"
      )
    }
  }

  if (is.function(labels)) {
    labels <- labels(breaks)
  } else {
    if (length(labels) != length(breaks)) {
      cli::cli_abort("{.arg labels} and {.arg breaks} must be same length")
    }
    if (is.expression(labels)) {
      labels <- as.list(labels)
    } else {
      labels <- as.character(labels)
    }
  }

  list(breaks = breaks, labels = labels)
}
