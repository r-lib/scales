#' Number formatters
#'
#' @description
#' A set of functions to format numeric values:
#'
#' * `number_format()` and `number()` are generic formatters for numbers.
#' * `comma_format()` and `comma()` format numbers with commas separating
#'   thousands.
#' * `percent_format()` and `percent()` multiply values by one hundred and
#'   display percent sign.
#' * `unit_format()` adds units to the values.
#' * `number_si()` scales and adds abbreviated SI units to the values.
#'
#' All formatters allow you to re-`scale` (multiplicatively), to round to
#' specified `accuracy`, to add custom `suffix` and `prefix` and to specify
#' `decimal.mark` and `big.mark`.
#'
#' `number_si()` gives limited SI unit labels: "K" for values \eqn{\ge} 10e3, "
#' M" for \eqn{\ge} 10e6, "B" for \eqn{\ge} 10e9, and "T" for \eqn{\ge} 10e12.
#' It respects all arguments except `scale` which is set internally.
#'
#' @return `*_format()` returns a function with single parameter
#'   `x`, a numeric vector, that returns a character vector.
#' @param x A numeric vector to format.
#' @param accuracy Number to round to, `NULL` for automatic guess.
#' @param scale A scaling factor: `x` will be multiply by `scale` before
#'   formating (useful if the underlying data is on another scale,
#'   e.g. for computing percentages or thousands).
#' @param prefix,suffix Symbols to display before and after value.
#' @param big.mark Character used between every 3 digits to separate thousands.
#' @param decimal.mark The character to be used to indicate the numeric
#'   decimal point.
#' @param trim Logical, if `FALSE`, values are right-justified to a common
#'   width (see [base::format()]).
#' @param ... Other arguments passed on to [base::format()].
#' @export
#' @examples
#' # number()
#' v <- c(12.3, 4, 12345.789, 0.0002)
#' number(v)
#' number(v, big.mark = ",")
#' number(v, accuracy = .001)
#' number(v, accuracy = .001, decimal.mark = ",")
#' number(v, accuracy = .5)
#'
#' # number_format()
#' my_format <- number_format(big.mark = "'", decimal.mark = ",")
#' my_format(v)
#'
number_format <- function(accuracy = 1, scale = 1, prefix = "",
                          suffix = "", big.mark = " ", decimal.mark = ".",
                          trim = TRUE, ...) {
  force_all(
    accuracy,
    scale,
    prefix,
    suffix,
    big.mark,
    decimal.mark,
    trim,
    ...
  )
  function(x) number(
      x,
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
#' @rdname number_format
number <- function(x, accuracy = 1, scale = 1, prefix = "",
                   suffix = "", big.mark = " ", decimal.mark = ".",
                   trim = TRUE, ...) {
  if (length(x) == 0) return(character())
  accuracy <- accuracy %||% precision(x * scale)
  x <- round_any(x, accuracy / scale)
  nsmall <- -floor(log10(accuracy))
  nsmall <- min(max(nsmall, 0), 20)

  ret <- format(
    scale * x,
    big.mark = big.mark,
    decimal.mark = decimal.mark,
    trim = trim,
    nsmall = nsmall,
    scientific = FALSE,
    ...
  )
  ret <- paste0(prefix, ret, suffix)
  ret[is.infinite(x)] <- as.character(x[is.infinite(x)])

  # restore NAs from input vector
  ret[is.na(x)] <- NA
  names(ret) <- names(x)

  ret
}

precision <- function(x) {
  # cannot calculate a precision if all values are Inf or NA
  if (all(is.infinite(x) | is.na(x))) {
    return(1)
  }

  rng <- range(x, na.rm = TRUE, finite = TRUE)

  span <- if (zero_range(rng)) abs(rng[1]) else diff(rng)
  if (span == 0) {
    return(1)
  }

  10^floor(log10(span))
}

#' @export
#' @rdname number_format
#' @param digits Deprecated, use `accuracy` instead.
#' @examples
#' # comma() and comma_format()
#' comma_format()(c(1, 1e3, 2000, 1e6))
#' comma_format(accuracy = .01)(c(1, 1e3, 2000, 1e6))
#' comma(c(1, 1e3, 2000, 1e6))
#'
comma_format <- function(accuracy = 1, scale = 1, prefix = "",
                         suffix = "", big.mark = ",", decimal.mark = ".",
                         trim = TRUE, digits, ...) {
  if (!missing(digits)) {
    warning(
      "`digits` argument is deprecated, use `accuracy` instead.",
      .call = FALSE
    )
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
#' @rdname number_format
comma <- function(x, accuracy = 1, scale = 1, prefix = "",
                  suffix = "", big.mark = ",", decimal.mark = ".",
                  trim = TRUE, digits, ...) {
  if (!missing(digits)) {
    warning(
      "`digits` argument is deprecated, use `accuracy` instead.",
      .call = FALSE
    )
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


#' @export
#' @rdname number_format
#' @examples
#' # percent() and percent_format()
#' percent_format()(runif(10))
#' percent(runif(10))
#'
#' per_mille <- percent_format(
#'   scale = 1000,
#'   suffix = "\u2030",
#'   accuracy = .1
#' )
#' per_mille(.1234)
#'
#' french_percent <- percent_format(
#'   decimal.mark = ",",
#'   suffix = " %"
#' )
#' french_percent(runif(10))
#'
percent_format <- function(accuracy = NULL, scale = 100, prefix = "",
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

#' @export
#' @rdname number_format
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

#' @export
#' @rdname number_format
#' @param unit The units to append.
#' @param sep The separator between the number and the unit label.
#' @examples
#' # unit_format()
#' # labels in kilometer when the raw data are in meter
#' km <- unit_format(unit = "km", scale = 1e-3, digits = 2)
#' km(runif(10) * 1e3)
#'
#' # labels in hectares, raw data in square meters
#' ha <- unit_format(unit = "ha", scale = 1e-4)
#' km(runif(10) * 1e5)
#'
unit_format <- function(accuracy = 1, scale = 1, prefix = "",
                        unit = "m", sep = " ", suffix = paste0(sep, unit),
                        big.mark = " ", decimal.mark = ".",
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

#' @rdname number_format
#' @export
#' @examples
#' # degree_format()
#' celcius <- degree_format(unit = "C")
#' celcius(rnorm(10) * 10)
#'
#' west <- degree_format(unit = "W")
#' west(runif(10) * 100)
degree_format <- function(accuracy = 1, scale = 1, prefix = "",
                          unit = "", sep = "",
                          suffix = paste0(sep, "\u00b0", unit),
                          big.mark = " ", decimal.mark = ".",
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

#' @rdname number_format
#' @export
number_si <- function(x, prefix = "", suffix = "", ...) {
  breaks <- c(" " = 0, 10^c(K = 3, M = 6, B = 9, "T" = 12))

  n_suffix <- cut(abs(x),
    breaks = c(unname(breaks), Inf),
    labels = c(names(breaks)),
    right = FALSE
  )

  # for handling NA's correctly
  n_suffix[is.na(n_suffix)] <- " "
  scale <- 1 / breaks[n_suffix]
  # for handling Inf and 0-1 correctly
  scale[which(scale %in% c(Inf, NA))] <- 1

  number(x,
    scale = unname(scale),
    prefix = prefix,
    suffix = paste0(n_suffix, suffix),
    ...
  )
}

