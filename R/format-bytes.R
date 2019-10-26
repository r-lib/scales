#' Bytes formatter: convert to byte measurement and display symbol
#'
#' @return a function with three parameters, `x`, a numeric vector that returns
#'   a character vector, `symbol` the byte symbol (e.g. "kB") desired and the
#'   measurement `units` (traditional `binary` or `si` for SI metric units).
#' @param x a numeric vector to format
#' @param symbol byte symbol to use. If "auto" the symbol used will be
#'   determined separately for each value of `x`. Valid symbols are "B", "kB",
#'   "MB", "GB", "TB", "PB", "EB", "ZB", and "YB" for SI units, and the "iB"
#'   variants for binary units.
#' @param units which unit base to use, "binary" (1024 base) or "si" (1000 base)
#' @param ... other arguments passed to [number()]
#' @references Units of Information (Wikipedia) :
#'   \url{http://en.wikipedia.org/wiki/Units_of_information}
#' @export
#' @examples
#' number_bytes_format()(sample(3000000000, 10))
#' number_bytes(sample(3000000000, 10))
#' number_bytes(sample(3000000000, 10), accuracy = .1)
#' number_bytes(1024^(0:4))
#' number_bytes(1024^(0:4), units = "si", accuracy = .01)
#' number_bytes(1000^(1:3), "kB", units = "si")
number_bytes_format <- function(symbol = "auto", units = "binary", ...) {
  function(x) number_bytes(x, symbol, units, ...)
}

#' @export
#' @rdname number_bytes_format
number_bytes <- function(x, symbol = "auto", units = c("binary", "si"), ...) {
  units <- match.arg(units, c("binary", "si"))

  powers <- si_powers[si_powers >= 3] / 3 # powers of 1000
  prefix <- names(powers)

  symbols <- c("B", switch(units,
    si     = paste0(prefix, "B"),
    binary = paste0(toupper(prefix), "iB")
  ))

  symbol <- validate_byte_symbol(symbol, symbols)
  base <- switch(units, binary = 1024, si = 1000)

  if (symbol == "auto") {
    power <- findInterval(abs(x), base^powers)
    symbol <- symbols[1L + power]
  } else {
    power <- match(symbol, symbols) - 1L
  }

  number(x / base^power, suffix = paste0(" ", symbol), ...)
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
