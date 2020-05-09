#' Generate sequence of fixed size intervals covering range.
#'
#' @param range range
#' @param size interval size
#' @param ... other arguments passed on to methods
#' @keywords internal
#' @export
#' @seealso [plyr::round_any()]
fullseq <- function(range, size, ...) UseMethod("fullseq")

#' @export
fullseq.numeric <- function(range, size, ..., pad = FALSE) {
  if (zero_range(range)) return(range + size * c(-1, 1) / 2)

  x <- seq(
    round_any(range[1], size, floor),
    round_any(range[2], size, ceiling),
    by = size
  )

  if (pad) {
    # Add extra bin on bottom and on top, to guarantee that we cover complete
    # range of data, whether right = T or F
    c(min(x) - size, x, max(x) + size)
  } else {
    x
  }
}

#' @export
fullseq.Date <- function(range, size, ...) {
  seq(floor_date(range[1], size), ceiling_date(range[2], size), by = size)
}
#' @export
fullseq.POSIXt <- function(range, size, ...) {

  # for subsecond interval support
  # seq() does not support partial secs in character strings
  parsed <- parse_unit_spec(size)
  if (parsed$unit == "sec") {
    seq(floor_time(range[1], size), ceiling_time(range[2], size), by = parsed$mult)
  } else {
    seq(floor_time(range[1], size), ceiling_time(range[2], size), by = size)
  }
}
#' @export
fullseq.difftime <- function(range, size, ...) {
  if (is.numeric(size)) {
    size_seconds <- size
  } else {
    size_seconds <- unit_seconds(size)
  }

  input_units <- units(range)

  x <- seq(
    round_any(as.numeric(range[1], units = "secs"), size_seconds, floor),
    round_any(as.numeric(range[2], units = "secs"), size_seconds, ceiling),
    by = size_seconds
  )

  x <- as.difftime(x, units = "secs")
  units(x) <- input_units
  x
}
