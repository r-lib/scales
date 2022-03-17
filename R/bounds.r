#' Rescale continuous vector to have specified minimum and maximum
#'
#' @param x continuous vector of values to manipulate.
#' @param to output range (numeric vector of length two)
#' @param from input range (vector of length two).  If not given, is
#'   calculated from the range of `x`
#' @param ... other arguments passed on to methods
#' @keywords manip
#' @export
#' @examples
#' rescale(1:100)
#' rescale(runif(50))
#' rescale(1)
rescale <- function(x, to, from, ...) {
  UseMethod("rescale")
}


#' @rdname rescale
#' @export
rescale.numeric <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE, finite = TRUE), ...) {
  if (zero_range(from) || zero_range(to)) {
    return(ifelse(is.na(x), NA, mean(to)))
  }
  (x - from[1]) / diff(from) * diff(to) + to[1]
}

#' @export
rescale.NULL <- function(...) NULL

#' @rdname rescale
#' @export
rescale.dist <- rescale.numeric


#' @rdname rescale
#' @export
rescale.logical <- rescale.numeric

#' @rdname rescale
#' @export
rescale.POSIXt <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE, finite = TRUE), ...) {
  x <- as.numeric(x)
  from <- as.numeric(from)
  rescale.numeric(x = x, to = to, from = from)
}

#' @rdname rescale
#' @export
rescale.Date <- rescale.POSIXt

#' @rdname rescale
#' @export
rescale.integer64 <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE), ...) {
  if (zero_range(from, tol = 0) || zero_range(to)) {
    return(ifelse(is.na(x), NA, mean(to)))
  }
  (x - from[1]) / diff(from) * diff(to) + to[1]
}


#' Rescale vector to have specified minimum, midpoint, and maximum
#'
#' @export
#' @param x vector of values to manipulate.
#' @param to output range (numeric vector of length two)
#' @param from input range (vector of length two).  If not given, is
#'   calculated from the range of `x`
#' @param mid mid-point of input range
#' @param ... other arguments passed on to methods
#' @examples
#' rescale_mid(1:100, mid = 50.5)
#' rescale_mid(runif(50), mid = 0.5)
#' rescale_mid(1)
rescale_mid <- function(x, to, from, mid, ...) {
  UseMethod("rescale_mid")
}

#' @rdname rescale_mid
#' @export
rescale_mid.numeric <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE), mid = 0, ...) {
  if (zero_range(from) || zero_range(to)) {
    return(ifelse(is.na(x), NA, mean(to)))
  }

  extent <- 2 * max(abs(from - mid))
  (x - mid) / extent * diff(to) + mean(to)
}

#' @export
rescale_mid.NULL <- function(...) NULL

#' @rdname rescale_mid
#' @export
rescale_mid.logical <- rescale_mid.numeric

#' @rdname rescale_mid
#' @export
rescale_mid.dist <- rescale_mid.numeric


#' @rdname rescale_mid
#' @export
rescale_mid.POSIXt <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE),
                               mid, ...) {
  x <- as.numeric(as.POSIXct(x))
  if (!is.numeric(from)) {
    from <- as.numeric(as.POSIXct(from))
  }
  if (!is.numeric(mid)) {
    mid <- as.numeric(as.POSIXct(mid))
  }
  rescale_mid.numeric(x = x, to = to, from = from, mid = mid)
}

#' @rdname rescale_mid
#' @export
rescale_mid.Date <- rescale_mid.POSIXt

#' @rdname rescale_mid
#' @export
rescale_mid.integer64 <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE), mid = 0, ...) {
  if (zero_range(from, tol = 0) || zero_range(to)) {
    return(ifelse(is.na(x), NA, mean(to)))
  }

  extent <- 2 * max(abs(from - mid))
  (x - mid) / extent * diff(to) + mean(to)
}


#' Rescale numeric vector to have specified maximum
#'
#' @export
#' @param x numeric vector of values to manipulate.
#' @param to output range (numeric vector of length two)
#' @param from input range (numeric vector of length two).  If not given, is
#'   calculated from the range of `x`
#' @examples
#' rescale_max(1:100)
#' rescale_max(runif(50))
#' rescale_max(1)
rescale_max <- function(x, to = c(0, 1), from = range(x, na.rm = TRUE)) {
  x / from[2] * to[2]
}

#' Don't perform rescaling
#'
#' @param x numeric vector of values to manipulate.
#' @param ... all other arguments ignored
#' @export
#' @examples
#' rescale_none(1:100)
rescale_none <- function(x, ...) {
  x
}

#' Out of bounds handling
#'
#' @description
#' This set of functions modify data values outside a given range.
#' The `oob_*()` functions are designed to be passed as the `oob` argument of
#' ggplot2 continuous and binned scales, with `oob_discard` being an exception.
#'
#' These functions affect out of bounds values in the following ways:
#'
#' * `oob_censor()` replaces out of bounds values with `NA`s. This is the
#'   default `oob` argument for continuous scales.
#' * `oob_censor_any()` acts like `oob_censor()`, but also replaces infinite
#'   values with `NA`s.
#' * `oob_squish()` replaces out of bounds values with the nearest limit. This
#'   is the default `oob` argument for binned scales.
#' * `oob_squish_any()` acts like `oob_squish()`, but also replaces infinite
#'   values with the nearest limit.
#' * `oob_squish_infinite()` only replaces infinite values by the nearest limit.
#' * `oob_keep()` does not adjust out of bounds values. In position scales,
#'    behaves as zooming limits without data removal.
#' * `oob_discard()` removes out of bounds values from the input. Not suitable
#'    for ggplot2 scales.
#'
#' @param x A numeric vector of values to modify.
#' @param range A numeric vector of length two giving the minimum and maximum
#'   limit of the desired output range respectively.
#' @param only.finite A logical of length one. When `TRUE`, only finite values
#'   are altered. When `FALSE`, also infinite values are altered.
#'
#' @return Most `oob_()` functions return a vector of numerical values of the
#'   same length as the `x` argument, wherein out of bounds values have been
#'   modified. Only `oob_discard()` returns a vector of less than or of equal
#'   length to the `x` argument.
#'
#' @details The `oob_censor_any()` and `oob_squish_any()` functions are the same
#' as `oob_censor()` and `oob_squish()` with the `only.finite` argument set to
#' `FALSE`.
#'
#' Replacing position values with `NA`s, as `oob_censor()` does, will typically
#' lead to removal of those datapoints in ggplot.
#'
#' Setting ggplot coordinate limits is equivalent to using `oob_keep()` in
#' position scales.
#'
#' @section Old interface: `censor()`, `squish()`, `squish_infinite()` and
#'   `discard()` are no longer recommended; please use `oob_censor()`,
#'   `oob_squish()`, `oob_squish_infinite()` and `oob_discard()` instead.
#'
#' @name oob
#'
#' @examples
#' # Censoring replaces out of bounds values with NAs
#' oob_censor(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#' oob_censor_any(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#'
#' # Squishing replaces out of bounds values with the nearest range limit
#' oob_squish(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#' oob_squish_any(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#' oob_squish_infinite(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#'
#' # Keeping does not alter values
#' oob_keep(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
#'
#' # Discarding will remove out of bounds values
#' oob_discard(c(-Inf, -1, 0.5, 1, 2, NA, Inf))
NULL

#' @rdname oob
#' @export
oob_censor <- function(x, range = c(0, 1), only.finite = TRUE) {
  force(range)
  finite <- if (only.finite) is.finite(x) else TRUE
  x[finite & x < range[1]] <- NA_real_
  x[finite & x > range[2]] <- NA_real_
  x
}

#' @rdname oob
#' @export
oob_censor_any <- function(x, range = c(0, 1)) {
  oob_censor(x, range = range, only.finite = FALSE)
}

#' @rdname oob
#' @export
oob_discard <- function(x, range = c(0, 1)) {
  force(range)
  x[x >= range[1] & x <= range[2]]
}

#' @rdname oob
#' @author `oob_squish()`: Homer Strong <homer.strong@@gmail.com>
#' @export
oob_squish <- function(x, range = c(0, 1), only.finite = TRUE) {
  force(range)
  finite <- if (only.finite) is.finite(x) else TRUE
  x[finite & x < range[1]] <- range[1]
  x[finite & x > range[2]] <- range[2]
  x
}

#' @rdname oob
#' @export
oob_squish_any <- function(x, range = c(0, 1)) {
  oob_squish(x, range, only.finite = FALSE)
}

#' @rdname oob
#' @export
oob_squish_infinite <- function(x, range = c(0, 1)) {
  force(range)
  x[x == -Inf] <- range[1]
  x[x == Inf] <- range[2]
  x
}

#' @rdname oob
#' @export
oob_keep <- function(x, range = c(0, 1)) {
  x
}

#' @rdname oob
#' @export
censor <- oob_censor

#' @rdname oob
#' @export
discard <- oob_discard

#' @rdname oob
#' @export
squish <- oob_squish

#' @rdname oob
#' @export
squish_infinite <- oob_squish_infinite


#' Expand a range with a multiplicative or additive constant
#'
#' @param range range of data, numeric vector of length 2
#' @param mul multiplicative constant
#' @param add additive constant
#' @param zero_width distance to use if range has zero width
#' @export
expand_range <- function(range, mul = 0, add = 0, zero_width = 1) {
  if (is.null(range)) {
    return()
  }

  width <- if (zero_range(range)) zero_width else diff(range)

  range + c(-1, 1) * (width * mul + add)
}

#' Determine if range of vector is close to zero, with a specified tolerance
#'
#' The machine epsilon is the difference between 1.0 and the next number
#' that can be represented by the machine. By default, this function
#' uses epsilon * 1000 as the tolerance. First it scales the values so that
#' they have a mean of 1, and then it checks if the difference between
#' them is larger than the tolerance.
#'
#' @examples
#' eps <- .Machine$double.eps
#' zero_range(c(1, 1 + eps))
#' zero_range(c(1, 1 + 99 * eps))
#' zero_range(c(1, 1 + 1001 * eps))
#' zero_range(c(1, 1 + 2 * eps), tol = eps)
#'
#' # Scaling up or down all the values has no effect since the values
#' # are rescaled to 1 before checking against tol
#' zero_range(100000 * c(1, 1 + eps))
#' zero_range(100000 * c(1, 1 + 1001 * eps))
#' zero_range(.00001 * c(1, 1 + eps))
#' zero_range(.00001 * c(1, 1 + 1001 * eps))
#'
#' # NA values
#' zero_range(c(1, NA)) # NA
#' zero_range(c(1, NaN)) # NA
#'
#' # Infinite values
#' zero_range(c(1, Inf)) # FALSE
#' zero_range(c(-Inf, Inf)) # FALSE
#' zero_range(c(Inf, Inf)) # TRUE
#'
#' @export
#' @param x numeric range: vector of length 2
#' @param tol A value specifying the tolerance.
#' @return logical `TRUE` if the relative difference of the endpoints of
#' the range are not distinguishable from 0.
zero_range <- function(x, tol = 1000 * .Machine$double.eps) {
  if (length(x) == 1) {
    return(TRUE)
  }
  if (length(x) != 2) stop("x must be length 1 or 2")
  if (any(is.na(x))) {
    return(NA)
  }

  # Special case: if they are equal as determined by ==, then there
  # is zero range. Also handles (Inf, Inf) and (-Inf, -Inf)
  if (x[1] == x[2]) {
    return(TRUE)
  }

  # If we reach this, then x must be (-Inf, Inf) or (Inf, -Inf)
  if (all(is.infinite(x))) {
    return(FALSE)
  }

  # Take the smaller (in magnitude) value of x, and use it as the scaling
  # factor.
  m <- min(abs(x))

  # If we get here, then exactly one of the x's is 0. Return FALSE
  if (m == 0) {
    return(FALSE)
  }

  # If x[1] - x[2] (scaled to 1) is smaller than tol, then return
  # TRUE; otherwise return FALSE
  abs((x[1] - x[2]) / m) < tol
}
