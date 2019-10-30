#' Create a new transformation object
#'
#' A transformation encapsulates a transformation and its inverse, as well
#' as the information needed to create pleasing breaks and labels. The breaks
#' function is applied on the transformed range of the range, and it's
#' expected that the labels function will perform some kind of inverse
#' transformation on these breaks to give them labels that are meaningful on
#' the original scale.
#'
#' @param name transformation name
#' @param transform function, or name of function, that performs the
#'   transformation
#' @param inverse function, or name of function, that performs the
#'   inverse of the transformation
#' @param breaks default breaks function for this transformation. The breaks
#'   function is applied to the raw data.
#' @param minor_breaks default minor breaks function for this transformation.
#' @param format default format for this transformation. The format is applied
#'   to breaks generated to the raw data.
#' @param domain domain, as numeric vector of length 2, over which
#'   transformation is valued
#' @seealso \Sexpr[results=rd,stage=build]{scales:::seealso_trans()}
#' @export
#' @keywords internal
trans_new <- function(name, transform, inverse, breaks = extended_breaks(),
                      minor_breaks = regular_minor_breaks(),
                      format = format_format(), domain = c(-Inf, Inf)) {
  if (is.character(transform)) transform <- match.fun(transform)
  if (is.character(inverse)) inverse <- match.fun(inverse)

  structure(
    list(
      name = name,
      transform = transform,
      inverse = inverse,
      breaks = breaks,
      minor_breaks = minor_breaks,
      format = format,
      domain = domain
    ),
    class = "trans"
  )
}

#' @rdname trans_new
#' @export
is.trans <- function(x) inherits(x, "trans")

#' @export
print.trans <- function(x, ...) cat("Transformer: ", x$name, "\n")

#' @export
plot.trans <- function(x, y, ..., xlim, ylim = NULL) {
  if (is.null(ylim)) {
    ylim <- range(x$transform(seq(xlim[1], xlim[2], length = 100)), finite = TRUE)
  }

  plot(
    xlim, ylim,
    xlab = "",
    ylab = "",
    type = "n",
    main = paste0("Transformer: ", x$name),
  )

  graphics::grid(lty = "solid")
  graphics::abline(h = 0, v = 0, col = "grey90", lwd = 5)
  graphics::lines(x, xlim = xlim)
}

#' @export
lines.trans <- function(x, ..., xlim) {
  xgrid <- seq(xlim[1], xlim[2], length = 100)
  y <- suppressWarnings(x$transform(xgrid))

  graphics::lines(xgrid, y, ...)
}

#' @rdname trans_new
#' @export
as.trans <- function(x) {
  if (is.trans(x)) return(x)

  f <- paste0(x, "_trans")
  match.fun(f)()
}

#' Compute range of transformed values
#'
#' Silently drops any ranges outside of the domain of `trans`.
#'
#' @param trans a transformation object, or the name of a transformation object
#'   given as a string.
#' @param x a numeric vector to compute the range of
#' @export
#' @keywords internal
trans_range <- function(trans, x) {
  trans <- as.trans(trans)
  range(trans$transform(range(squish(x, trans$domain), na.rm = TRUE)))
}
