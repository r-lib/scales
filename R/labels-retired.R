#' Older interface to `label_bytes()`
#'
#' @description
#' `r lifecycle::badge('superseded')`
#'
#' These functions are kept for backward compatibility, but you should switch
#' to [label_bytes()] for new code.
#'
#' @keywords internal
#' @param symbol byte symbol to use. If "auto" the symbol used will be
#'   determined separately for each value of `x`. Valid symbols are "B", "kB",
#'   "MB", "GB", "TB", "PB", "EB", "ZB", and "YB" for SI units, and the "iB"
#'   variants for binary units.
#' @param units which unit base to use, "binary" (1024 base) or "si" (1000 base)
#' @export
number_bytes_format <- function(symbol = "auto", units = "binary", ...) {
  force_all(symbol, units, ...)
  function(x) {
    number_bytes(x, symbol, units, ...)
  }
}

#' @export
#' @rdname number_bytes_format
number_bytes <- function(x, symbol = "auto", units = c("binary", "si"), accuracy = 1, ...) {
  units <- match.arg(units, c("binary", "si"))

  powers <- si_powers[si_powers >= 3] / 3 # powers of 1000
  prefix <- names(powers)

  symbols <- c("B", switch(units,
    si     = paste0(prefix, "B"),
    binary = paste0(toupper(prefix), "iB")
  ))

  symbol <- validate_byte_symbol(symbol, symbols)
  base <- switch(units,
    binary = 1024,
    si = 1000
  )

  if (symbol == "auto") {
    power <- findInterval(abs(x), base^powers)
    symbol <- symbols[1L + power]
  } else {
    power <- match(symbol, symbols) - 1L
  }

  number(x / base^power, accuracy = accuracy, suffix = paste0(" ", symbol), ...)
}

validate_byte_symbol <- function(symbol, symbols, default = "auto") {
  if (length(symbol) != 1) {
    n <- length(symbol)
    stop("`symbol` must have length 1, not length ", n, ".", call. = FALSE)
  }

  valid_symbols <- c(default, symbols)
  if (!(symbol %in% valid_symbols)) {
    warning(
      "`symbol` must be one of: '", paste0(valid_symbols, collapse = "', '"),
      "'; not '", symbol, "'.\n",
      "Defaulting to '", default, "'.",
      call. = FALSE
    )
    symbol <- default
  }

  symbol
}

#' Format labels after transformation
#'
#' `r lifecycle::badge('superseded')`
#'
#' @param trans transformation to apply
#' @param format additional formatter to apply after transformation
#' @return a function with single parameter x, a numeric vector, that
#'    returns a character vector of list of expressions
#' @export
#' @keywords internal
#' @examples
#' tf <- trans_format("log10", scientific_format())
#' tf(10^1:6)
trans_format <- function(trans, format = scientific_format()) {
  if (is.character(trans)) trans <- match.fun(trans)
  force(format)

  function(x) {
    x <- trans(x)
    format(x)
  }
}


#' Unit labels
#'
#' @description
#' `r lifecycle::badge('superseded')`
#'
#' This function is kept for backward compatiblity; you should either use
#' [label_number()] or [label_number_si()] instead.
#'
#' @inheritParams number_format
#' @keywords internal
#' @param unit The units to append.
#' @param sep The separator between the number and the unit label.
#' @export
#' @examples
#' # Label with units
#' demo_continuous(c(0, 1), labels = unit_format(unit = "m"))
#' # Labels in kg, but original data in g
#' km <- unit_format(unit = "km", scale = 1e-3, digits = 2)
#' demo_continuous(c(0, 2500), labels = km)
unit_format <- function(accuracy = NULL, scale = 1, prefix = "",
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

#' Label using `format()`
#'
#' @description
#' `r lifecycle::badge('superseded')`
#'
#' This function is kept for backward compatiblity; you should either use
#' [label_number()] or [label_date()] instead.
#'
#' @param ... Arguments passed on to [format()].
#' @export
#' @keywords internal
format_format <- function(...) {
  force_all(...)

  function(x) {
    if (!is.null(names(x))) {
      return(names(x))
    }
    ret <- format(x, ..., trim = TRUE, justify = "left")

    # format.character() renders NA as "NA"
    ret[is.na(x)] <- NA

    ret
  }
}
