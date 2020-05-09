offset_by <- function(x, size) {
  UseMethod("offset_by")
}

#' @export
offset_by.numeric <- function(x, size) {
  x + size
}

#' @export
offset_by.Date <- function(x, size) {
  fun <- function(x) seq(x, length.out = 2, by = size)[2]
  out <- lapply(x, fun)
  do.call(c, out)
}

#' @export
offset_by.POSIXt <- function(x, size) {
  # for subsecond interval support
  # seq() does not support partial secs in character strings
  if (is.character(size) && (parsed <- parse_unit_spec(size))$unit == "sec") {
    fun <- function(x) seq(x, length.out = 2, by = parsed$mult)[2]
  } else {
    fun <- function(x) seq(x, length.out = 2, by = size)[2]
  }
  out <- lapply(x, fun)
  do.call(c, out)
}
