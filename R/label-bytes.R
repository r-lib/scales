#' Label bytes (1 kB, 2 MB, etc)
#'
#' Scale bytes into human friendly units. Can use either SI units (e.g.
#' kB = 1000 bytes) or binary units (e.g. kiB = 1024 bytes). See
#' [Units of Information](https://en.wikipedia.org/wiki/Units_of_information)
#' on Wikipedia for more details.
#'
#' @param units Unit to use. Should either one of:
#'   * "kB", "MB", "GB", "TB", "PB", "EB", "ZB", and "YB" for
#'     SI units (base 1000).
#'   * "kiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", and "YiB" for
#'     binary units (base 1024).
#'   * `auto_si` or `auto_binary` to automatically pick the most appropriate
#'     unit for each value.
#' @inheritParams number_format
#' @param ... Other arguments passed on to [number()]
#' @return A labeller function that takes a numeric vector of breaks and
#'   returns a character vector of labels.
#' @export
#' @family labels for continuous scales
#' @family labels for log scales
#' @examples
#' demo_continuous(c(1, 1e6))
#' demo_continuous(c(1, 1e6), labels = label_bytes())
#'
#' # Auto units are particularly nice on log scales
#' demo_log10(c(1, 1e7), labels = label_bytes())
#'
#' # You can also set the units
#' demo_continuous(c(1, 1e6), labels = label_bytes("kB"))
#'
#' # You can also use binary units where a megabyte is defined as
#' # (1024) ^ 2 bytes rather than (1000) ^ 2. You'll need to override
#' # the default breaks to make this more informative.
#' demo_continuous(c(1, 1024^2),
#'   breaks = breaks_width(250 * 1024),
#'   labels = label_bytes("auto_binary")
#' )
label_bytes <- function(units = "auto_si", accuracy = 1, scale = 1, ...) {
  stopifnot(is.character(units), length(units) == 1)
  force_all(accuracy, ...)

  function(x) {
    if (units %in% c("auto_si", "auto_binary")) {
      scale_cut <- cut_bytes(if (units == "auto_binary") "binary" else "si")
      suffix <- ""
    } else {
      powers <- si_powers[si_powers >= 3] / 3 # powers of 1000
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

      suffix <- paste0(" ", units)
      scale <- scale / base^power
      scale_cut <- NULL
    }

    number(
      x,
      accuracy = accuracy,
      scale = scale,
      suffix = suffix,
      scale_cut = scale_cut,
      ...
    )
  }
}

cut_bytes <- function(units = c("si", "binary")) {
  units <- arg_match(units)

  powers <- si_powers[si_powers >= 3] / 3 # powers of 1000
  base <- if (units == "binary") 1024 else 1000
  suffix <- if (units == "binary") "iB" else "B"

  out <- c(0, base^powers)
  names(out) <- c(paste0(" ", suffix), paste0(" ", names(powers), suffix))
  out
}
