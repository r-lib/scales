#' Pretty breaks.
#' Uses default R break algorithm as implemented in \code{\link{pretty}}.
#'
#' @param n desired number of breaks
#' @param ... other arguments passed on to \code{\link{pretty}}
#' @export
#' @examples
#' pretty_breaks()(1:10)
#' pretty_breaks()(1:100)
#' pretty_breaks()(as.Date(c("2008-01-01", "2009-01-01")))
#' pretty_breaks()(as.Date(c("2008-01-01", "2090-01-01")))
pretty_breaks <- function(n = 5, ...) {
  function(x) {
    breaks <- pretty(x, n, ...)
    names(breaks) <- attr(breaks, "labels")
    breaks
  }
}

#' Extended breaks.
#' Uses Wilkinson's extended breaks algorithm as implemented in the 
#' \pkg{labeling} package.
#'
#' @param n desired number of breaks
#' @param ... other arguments passed on to \code{\link[labeling]{extended}}
#' @references Talbot, J., Lin, S., Hanrahan, P. (2010) An Extension of
#'  Wilkinson's Algorithm for Positioning Tick Labels on Axes, InfoVis
#'  2010.
#' @importFrom labeling extended
#' @export
#' @examples
#' extended_breaks()(1:10)
#' extended_breaks()(1:100)
extended_breaks <- function(n = 5, ...) {
  function(x) {
    extended(min(x), max(x), n, only.loose = FALSE, ...)
  }
}

#' Log breaks (integer breaks on log-transformed scales).
#' 
#' @param n desired number of breaks
#' @param base base of logarithm to use
#' @export
#' @examples
#' log_breaks()(c(1, 1e6))
#' log_breaks()(c(1, 1e5))
log_breaks <- function(n = 5, base = 10) {
  function(x) {
    rng <- log(range(x, na.rm = TRUE), base = base)
    min <- floor(rng[1])
    max <- ceiling(rng[2])
    
    if (max == min) return(base ^ min)
    
    by <- floor((max - min) / n) + 1
    base ^ seq(min, max, by = by)            
  }
}

#' Pretty breaks on transformed scale.
#'
#' These often do not produce very attractive breaks.
#' 
#' @param trans function of single variable, \code{x}, that given a numeric
#'   vector returns the transformed values
#' @param inv inverse of the transformation function
#' @param n desired number of ticks
#' @param ... other arguments passed on to pretty
#' @export
#' @examples
#' trans_breaks("log10", function(x) 10 ^ x)(c(1, 1e6))
#' trans_breaks("sqrt", function(x) x ^ 2)(c(1, 100))
#' trans_breaks(function(x) 1 / x, function(x) 1 / x)(c(1, 100))
#' trans_breaks(function(x) -x, function(x) -x)(c(1, 100))
trans_breaks <- function(trans, inv, n = 5, ...) {
  trans <- match.fun(trans)
  inv <- match.fun(inv)
  
  function(x) {
    inv(pretty(trans(x), n, ...))
  }
}

#' Compute breaks for continuous scale.
#'
#' This function wraps up the components needed to go from a continuous range
#' to a set of breaks and labels suitable for display on axes or legends.
#'
#' @param range numeric vector of length 2 giving the range of the underlying
#'   data
#' @param breaks either a vector of break values, or a break function that
#'   will make a vector of breaks when given the range of the data
#' @param labels either a vector of labels (character vector or list of 
#'   expression) or a format function that will make a vector of labels when
#'   called with a vector of breaks. Labels can only be specified manually if
#'   breaks are - it is extremely dangerous to supply labels if you don't know
#'   what the breaks will be.
#' @export
#' @examples
#' cbreaks(c(0, 100))
#' cbreaks(c(0, 100), pretty_breaks(3))
#' cbreaks(c(0, 100), pretty_breaks(10))
#' cbreaks(c(1, 100), log_breaks())
#' cbreaks(c(1, 1e4), log_breaks())
#'
#' cbreaks(c(0, 100), labels = math_format())
#' cbreaks(c(0, 1), labels = percent_format())
#' cbreaks(c(0, 1e6), labels = comma_format())
#' cbreaks(c(0, 1e6), labels = dollar_format())
#' cbreaks(c(0, 30), labels = dollar_format())
#'
#' # You can also specify them manually:
#' cbreaks(c(0, 100), breaks = c(15, 20, 80))
#' cbreaks(c(0, 100), breaks = c(15, 20, 80), labels = c(1.5, 2.0, 8.0))
#' cbreaks(c(0, 100), breaks = c(15, 20, 80), 
#'   labels = expression(alpha, beta, gamma))
cbreaks <- function(range, breaks = extended_breaks(), labels = scientific_format()) {
  
  if (zero_range(range)) {
    return(list(breaks = range[1], labels = format(range[1])))
  }
  
  if (is.function(breaks)) {
    breaks <- breaks(range)

    if (!is.function(labels)) {
      stop("Labels can only be manually specified in conjunction with breaks", 
        call. = FALSE)
    }
  }
  
  if (is.function(labels)) {
    labels <- labels(breaks)
  } else {
    if (length(labels) != length(breaks)) {
      stop("Labels and breaks must be same length")
    }
    if (is.expression(labels)) {
      labels <- as.list(labels)
    } else {
      labels <- as.character(labels)
    }
  }
  
  list(breaks = breaks, labels = labels)
}
