#' Bytes labels
#'
#' Scale bytes into human friendly units. Can use either SI units (e.g.
#' kB = 1000 bytes) or binary units (e.g. kiB = 1024 bytes). See
#' [Units of Information](http://en.wikipedia.org/wiki/Units_of_information)
#' on Wikipedia for more details.
#'
#' @param units Unit to use. Should either one of:
#'   * "kB", "MB", "GB", "TB", "PB", "EB", "ZB", and "YB" for
#'     SI units (base 1000).
#'   * "kiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", and "YiB" for
#'     binary units (base 1024).
#'   * `auto_si` or `auto_binary` to automatically pick the most approrpiate
#'     unit for each value.
#' @inheritParams number_format
#' @param ... Other arguments passed on to [number()]
#' @return A labeller function that takes a numeric vector of breaks and
#'   returns a character vector of labels.
#' @references
#' @export
#' @examples
#' demo_continuous(c(1, 1e6))
#' demo_continuous(c(1, 1e6), label = label_bytes())
#' # Force all to use same units
#' demo_continuous(c(1, 1e6), label = label_bytes("kB"))
#'
#' # Auto units are particularly nice on log scales
#' demo_log10(c(1, 1e6))
#' demo_log10(c(1, 1e7), label = label_bytes())
#'
#' # You can also use binary units where a megabyte is defined as
#' # (1024) ^ 2 bytes rather than (1000) ^ 2. You'll need to override
#' # the default breaks to make this more informative.
#' demo_continuous(c(1, 1024^2), label = label_bytes("auto_binary"))
#' demo_continuous(c(1, 1024^2),
#'   breaks = breaks_width(250 * 1024),
#'   label = label_bytes("auto_binary")
#' )
label_bytes <- function(units = "auto_si", accuracy = 1, ...) {
  stopifnot(is.character(units), length(units) == 1)
  force_all(accuracy, ...)

  function(x) {
    powers <- si_powers[si_powers >= 3] / 3 # powers of 1000

    if (units %in% c("auto_si", "auto_binary")) {
      base <- switch(units, auto_binary = 1024, auto_si = 1000)
      suffix <- switch(units, auto_binary = "iB", auto_si = "B")

      power <- findInterval(abs(x), c(0, base^powers)) - 1L
      units <- paste0(c("", names(powers))[power + 1L], suffix)
    } else {
      si_units <- paste0(names(powers), "B")
      bin_units <- paste0(names(powers), "iB")

      if (units %in% si_units) {
        base <- 1000
        power <- powers[[match(units, si_units)]]
      } else if (units %in% bin_units) {
        base <- 1024
        power <- powers[[match(units, bin_units)]]
      } else {
        stop("'", units, "' is not a valid unit", call. = FALSE)
      }
    }

    number(
      x / base^power,
      accuracy = accuracy,
      suffix = paste0(" ", units),
      ...
    )
  }
}

# ---------------------------------------------------------------------------

#' Older interface to label_bytes()
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

# Helpers -----------------------------------------------------------------

si_powers <- sort(c(
  "Y"      =  24L,
  "Z"      =  21L,
  "E"      =  18L,
  "P"      =  15L,
  "T"      =  12L,
  "G"      =   9L,
  "M"      =   6L,
  "k"      =   3L,
  "h"      =   2L,
  "da"     =   1L,
               0L,
  "d"      =  -1L,
  "c"      =  -2L,
  "m"      =  -3L,
  "\u00b5" =  -6L,
  "n"      =  -9L,
  "p"      = -12L,
  "f"      = -15L,
  "a"      = -18L,
  "z"      = -21L,
  "y"      = -24L
))

