#' Bytes formatter: convert to byte measurement and display symbol
#'
#' @inheritParams number_format
#' @param symbol byte symbol to use. If "auto" the symbol used will be
#'   determined separately for each value of `x`. Valid symbols are "B", "kB",
#'   "MB", "GB", "TB", "PB", "EB", "ZB", and "YB" for SI units, and the "iB"
#'   variants for binary units.
#' @param units which unit base to use, "binary" (1024 base) or "si" (1000 base)
#' @return a function with three parameters, `x`, a numeric vector that returns
#'   a character vector, `symbol` the byte symbol (e.g. "kB") desired and the
#'   measurement `units` (traditional `binary` or `si` for SI metric units).
#' @param ... other arguments passed to [number()]
#' @references Units of Information (Wikipedia) :
#'   \url{http://en.wikipedia.org/wiki/Units_of_information}
#' @export
#' @examples
#' demo_continuous(c(1, 1e6))
#' demo_continuous(c(1, 1e6), label = label_bytes())
#' # Force all to use same units
#' demo_continuous(c(1, 1e6), label = label_bytes("kB"))
#'
#' # Auto units are particularly nice on log scales
#' demo_log10(c(1, 1e6))
#' demo_log10(c(1, 1e6), label = label_bytes())
#'
#' # You can also use binary units where a megabyte is defined as
#' # (1024) ^ 2 bytes rather than (1000) ^ 2. You'll need to override
#' # the default breaks to make this more informative.
#' demo_continuous(c(1, 1e6), label = label_bytes(units = "binary"))
#' demo_continuous(c(1, 1e6),
#'   breaks = breaks_width(250 * 1024),
#'   label = label_bytes(units = "binary")
#' )
label_bytes <- function(symbol = "auto", units = c("si", "binary"), ...) {
  units <- match.arg(units)
  force_all(symbol, ...)

  function(x) {
    number_bytes(x, symbol, units, ...)
  }
}

#' @export
#' @rdname label_bytes
number_bytes_format <- function(symbol = "auto", units = "binary", ...) {
  force_all(symbol, units, ...)
  function(x) {
    number_bytes(x, symbol, units, ...)
  }
}

#' @export
#' @rdname label_bytes
number_bytes <- function(x, symbol = "auto", units = c("binary", "si"), accuracy = 1, ...) {
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
