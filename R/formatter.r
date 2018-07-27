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
#' * `unit_format()` add units to the values.
#'
#' All formatters allow you to re-`scale` (multiplicatively), to round to
#' specified `accuracy`, to add custom `suffix` and `prefix` and to specify
#' `decimal.mark` and `big.mark`.
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
  accuracy <- accuracy %||% precision(x)
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
  ret
}

precision <- function(x) {
  if (all(is.infinite(x))) {
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

#' Currency formatter: round to nearest cent and display dollar sign.
#'
#' The returned function will format a vector of values as currency.
#' If `accuracy` is not specified, values are rounded to the nearest cent,
#' and cents are displayed if any of the values has a non-zero cents and
#' the largest value is less than `largest_with_cents` which by default
#' is 100,000.
#'
#' @return A function with single parameter `x`, a numeric vector, that
#'   returns a character vector.
#' @param accuracy Number to round to, `NULL` for automatic guess.
#' @param scale A scaling factor: `x` will be multiply by `scale` before
#'   formating (useful to display the data on another scale, e.g. in k$).
#' @param prefix,suffix Symbols to display before and after value.
#' @param big.mark Character used between every 3 digits to separate thousands.
#' @param decimal.mark The character to be used to indicate the numeric
#'   decimal point.
#' @param trim Logical, if `FALSE`, values are right-justified to a common
#'   width (see [base::format()]).
#' @param largest_with_cents The value that all values of `x` must
#'   be less than in order for the cents to be displayed.
#' @param negative_parens Should negative values be shown with parentheses?
#' @param ... Other arguments passed on to [base::format()].
#' @param x A numeric vector to format.
#' @export
#' @examples
#' dollar_format()(c(-100, 0.23, 1.456565, 2e3))
#' dollar_format()(c(1:10 * 10))
#' dollar(c(100, 0.23, 1.456565, 2e3))
#' dollar(c(1:10 * 10))
#' dollar(10^(1:8))
#'
#' usd <- dollar_format(prefix = "USD ")
#' usd(c(100, -100))
#'
#' euro <- dollar_format(prefix = "", suffix = "\u20ac")
#' euro(100)
#'
#' finance <- dollar_format(negative_parens = TRUE)
#' finance(c(-100, 100))
dollar_format <- function(accuracy = NULL, scale = 1, prefix = "$",
                          suffix = "", big.mark = ",", decimal.mark = ".",
                          trim = TRUE, largest_with_cents = 100000,
                          negative_parens = FALSE, ...) {
  force_all(
    accuracy,
    scale,
    prefix,
    suffix,
    big.mark,
    decimal.mark,
    trim,
    largest_with_cents,
    negative_parens,
    ...
  )
  function(x) dollar(
      x,
      accuracy = accuracy,
      scale = scale,
      prefix = prefix,
      suffix = suffix,
      big.mark = big.mark,
      decimal.mark = decimal.mark,
      trim = trim,
      largest_with_cents = largest_with_cents,
      negative_parens,
      ...
    )
}

needs_cents <- function(x, threshold) {
  if (all(is.na(x))) {
    return(FALSE)
  }

  if (max(abs(x), na.rm = TRUE) > threshold) {
    return(FALSE)
  }

  !all(x == floor(x), na.rm = TRUE)
}

#' @export
#' @rdname dollar_format
dollar <- function(x, accuracy = NULL, scale = 1, prefix = "$",
                   suffix = "", big.mark = ",", decimal.mark = ".",
                   trim = TRUE, largest_with_cents = 100000,
                   negative_parens = FALSE, ...) {
  if (length(x) == 0) return(character())
  if (is.null(accuracy)) {
    if (needs_cents(x * scale, largest_with_cents)) {
      accuracy <- .01
    } else {
      accuracy <- 1
    }
  }
  if (identical(big.mark, ",") & identical(decimal.mark, ",")) {
    big.mark <- " "
  }

  negative <- !is.na(x) & x < 0
  if (negative_parens) {
    x <- abs(x)
  }

  amount <- number(
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

  if (negative_parens) {
    paste0(ifelse(negative, "(", ""), amount, ifelse(negative, ")", ""))
  } else {
    amount
  }
}


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
  paste0(
    prefix,
    format(x, decimal.mark = decimal.mark, trim = trim, scientific = TRUE, ...),
    suffix
  )
}

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
  x <- round(x, digits = 0)
  out <- utils::stack(lapply(rules, grep, x = x, perl = TRUE))
  out <- out[!duplicated(out$values), ] # only first result should be considered
  paste0(
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

#' Parse a text label to produce expressions for plotmath.
#'
#' @seealso [plotmath()]
#' @return a function with single parameter x, a character vector, that
#'    returns a list of expressions
#' @export
#' @examples
#' parse_format()(c("alpha", "beta", "gamma"))
parse_format <- function() {
  function(x) {
    lapply(as.character(x), function(x) parse(text = x, srcfile = NULL))
  }
}

#' Add arbitrary expression to a label.
#' The symbol that will be replace by the label value is `.x`.
#'
#' @param expr expression to use
#' @param format another format function to apply prior to mathematical
#'   transformation - this makes it easier to use floating point numbers in
#'   mathematical expressions.
#' @return a function with single parameter x, a numeric vector, that
#'    returns a list of expressions
#' @export
#' @seealso [plotmath()]
#' @examples
#' math_format()(1:10)
#' math_format(alpha + frac(1, .x))(1:10)
#' math_format()(runif(10))
#' math_format(format = percent)(runif(10))
math_format <- function(expr = 10^.x, format = force) {
  quoted <- substitute(expr)
  subs <- function(x) {
    do.call("substitute", list(quoted, list(.x = as.name(x))))
  }

  function(x) {
    x <- format(x)
    lapply(x, subs)
  }
}
globalVariables(".x")

#' Wrap text to a specified width, adding newlines for spaces if text exceeds
#' the width
#'
#' @param width value above which to wrap
#' @return Function with single parameter x, a character vector, that
#'    returns a wrapped character vector
#' @export
#' @examples
#' wrap_10 <- wrap_format(10)
#' wrap_10('A long line that needs to be wrapped')
wrap_format <- function(width) {
  force(width)
  function(x) {
    unlist(lapply(strwrap(x, width = width, simplify = FALSE), paste0, collapse = "\n"))
  }
}

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

#' Format with using any arguments to [format()].
#'
#' If the breaks have names, they will be used in preference to formatting
#' the breaks.
#'
#' @param ... other arguments passed on to [format()].
#' @seealso [format()], [format.Date()],
#'   [format.POSIXct()]
#' @export
format_format <- function(...) {
  force_all(...)

  function(x) {
    if (!is.null(names(x))) return(names(x))
    format(x, ..., trim = TRUE, justify = "left")
  }
}

#' Formatted dates and times.
#'
#' @param format Date/time format using standard POSIX specification.  See
#'  [strptime()] for possible formats.
#' @param tz a time zone name, see [timezones()]. Defaults
#'  to UTC
#' @export
#' @examples
#' a_time <- ISOdatetime(2012, 1, 1, 11, 30, 0, tz = "UTC")
#' a_date <- as.Date(a_time)
#'
#' date_format()(a_date)
#' date_format(format = "%A")(a_date)
#'
date_format <- function(format = "%Y-%m-%d", tz = "UTC") {
  force_all(format, tz)
  function(x) format(x, format, tz = tz)
}

#' @export
#' @rdname date_format
#' @examples
#' time_format()(a_time)
#' time_format(tz = "Europe/Berlin")(a_time)
#'
#' a_hms <- hms::as.hms(a_time, tz = "UTC")
#' time_format(format = "%H:%M")(a_hms)
time_format <- function(format = "%H:%M:%S", tz = "UTC") {
  force_all(format, tz)
  function(x) {
    if (inherits(x, "POSIXt")) {
      format(x, format = format, tz = tz)
    } else if (inherits(x, "difftime")) {
      format(as.POSIXct(x), format = format, tz = tz)
    } else {
      stop(
        "time_format can't be used with objects of class ", paste(class(x), collapse = "/"),
        ".",
        call. = FALSE
      )
    }
  }
}

#' p-values formatter
#'
#' Formatter for p-values, adding a symbol "<" for small p-values.
#'
#' @return `pvalue_format` returns a function with single parameter
#'   `x`, a numeric vector, that returns a character vector.
#' @param accuracy Number to round to.
#' @param decimal.mark The character to be used to indicate the numeric
#'   decimal point.
#' @param add_p Add "p=" before the value?
#' @param x A numeric vector of p-values.
#' @export
#' @examples
#' p <- c(.50, 0.12, .045, .011, .009, .00002, NA)
#' pvalue(p)
#' pvalue(p, accuracy = .01)
#' pvalue(p, add_p = TRUE)
#' custom_function <- pvalue_format(accuracy = .1, decimal.mark = ",")
#' custom_function(p)
pvalue_format <- function(accuracy = .001, decimal.mark = ".", add_p = FALSE) {
  force_all(accuracy, decimal.mark, add_p)
  function(x) pvalue(
      x,
      accuracy = accuracy,
      decimal.mark = decimal.mark,
      add_p = add_p
    )
}

#' @rdname pvalue_format
#' @export
pvalue <- function(x, accuracy = .001, decimal.mark = ".", add_p = FALSE) {
  res <- number(
    x,
    accuracy = accuracy,
    decimal.mark = decimal.mark,
    big.mark = ""
  )
  if (add_p) res <- paste0("p=", res)
  below <- number(
    accuracy,
    accuracy = accuracy,
    decimal.mark = decimal.mark,
    big.mark = ""
  )
  if (add_p) {
    below <- paste0("p<", below)
  } else {
    below <- paste0("<", below)
  }
  res[x < accuracy] <- below
  res
}

#' Bytes formatter: convert to byte measurement and display symbol.
#'
#' @return a function with three parameters, `x``, a numeric vector that
#'   returns a character vector, `symbol` the byte symbol (e.g. "Kb")
#'   desired and the measurement `units` (traditional `binary` or
#'   `si` for ISI metric units).
#' @param x a numeric vector to format
#' @param symbol byte symbol to use. If "auto" the symbol used will be
#'   determined by the maximum value of `x`. Valid symbols are
#'   "b", "Kb", "Mb", "Gb", "Tb", "Pb",
#'   "Eb", "Zb", and "Yb", along with their upper case
#'   equivalents and "iB" equivalents.
#' @param units which unit base to use, "binary" (1024 base) or
#'   "si" (1000 base) for ISI units.
#' @param ... other arguments passed to [number()]
#' @references Units of Information (Wikipedia) :
#'   \url{http://en.wikipedia.org/wiki/Units_of_information}
#' @export
#' @examples
#' number_bytes_format()(sample(3000000000, 10))
#' number_bytes(sample(3000000000, 10))
#' number_bytes(sample(3000000000, 10), accuracy = .1)
number_bytes_format <- function(symbol = "auto", units = "binary", ...) {
  function(x) number_bytes(x, symbol, units, ...)
}

#' @export
#' @rdname number_bytes_format
number_bytes <- function(x, symbol = "auto", units = c("binary", "si"), ...) {
  symbols <- c(
    "auto",
    "b", "Kb", "Mb", "Gb", "Tb", "Pb", "Eb", "Zb", "Yb",
    "B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB",
    "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB"
  )

  if (!(symbol %in% symbols)) {
    warning(paste(
      "`symbol` must be one of '", paste0(symbols, collapse = "', '"),
      "'. Defaulting to 'auto'."
    ), call. = F)
    symbol <- "auto"
  }

  units <- match.arg(units, c("binary", "si"))

  base <- switch(units, binary = 1024, si = 1000)

  if (symbol == "auto") {
    symbol <- as.character(cut(max(x, na.rm = T),
      breaks = c(base^(0:8), Inf),
      labels = c("b", "Kb", "Mb", "Gb", "Tb", "Pb", "Eb", "Zb", "Yb"),
      right = F
    ))
  }

  first <- tolower(substr(symbol, 1, 1))
  x <- switch(first,
    "b" = x,
    "k" = x / (base^1),
    "m" = x / (base^2),
    "g" = x / (base^3),
    "t" = x / (base^4),
    "p" = x / (base^5),
    "e" = x / (base^6),
    "z" = x / (base^7),
    "y" = x / (base^8)
  )

  number(
    x = x,
    suffix = paste0(" ", symbol),
    ...
  )
}
