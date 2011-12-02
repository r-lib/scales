#' Generate sequence of fixed size intervals covering range.
#' 
#' @param range range
#' @param size interval size
#' @param ... other arguments passed on to methods
#' @keywords internal
#' @export
#' @S3method fullseq Date
#' @S3method fullseq POSIXt
#' @seealso \code{\link[plyr]{round_any}}
fullseq <- function(range, size, ...) UseMethod("fullseq")

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

fullseq.Date <- function(range, size, ...) {
  seq(floor_date(range[1], size), ceiling_date(range[2], size), by = size)
}
fullseq.POSIXt <- function(range, size, ...) {
  seq(floor_time(range[1], size), ceiling_time(range[2], size), by = size)
}
