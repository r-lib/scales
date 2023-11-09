#' Create a new transformation object
#'
#' A transformation encapsulates a transformation and its inverse, as well
#' as the information needed to create pleasing breaks and labels. The `breaks()`
#' function is applied on the un-transformed range of the data, and the
#' `format()` function takes the output of the `breaks()` function and returns
#' well-formatted labels. Transformations may also include the derivatives of the
#' transformation and its inverse, but are not required to.
#'
#' @param name transformation name
#' @param transform function, or name of function, that performs the
#'   transformation
#' @param inverse function, or name of function, that performs the
#'   inverse of the transformation
#' @param d_transform Optional function, or name of function, that gives the
#'   derivative of the transformation. May be `NULL`.
#' @param d_inverse Optional function, or name of function, that gives the
#'   derivative of the inverse of the transformation. May be `NULL`.
#' @param breaks default breaks function for this transformation. The breaks
#'   function is applied to the un-transformed data.
#' @param minor_breaks default minor breaks function for this transformation.
#' @param format default format for this transformation. The format is applied
#'   to breaks generated on the un-transformed data.
#' @param domain the allowed range of the data to be transformed. The function
#'   in the `transform` argument is expected to be able to transform the `domain`
#'   argument.
#' @seealso \Sexpr[results=rd,stage=build]{scales:::seealso_transform()}
#' @export
#' @keywords internal
#' @aliases trans
new_transform <- function(name, transform, inverse,
                          d_transform = NULL, d_inverse = NULL,
                          breaks = extended_breaks(),
                          minor_breaks = regular_minor_breaks(),
                          format = format_format(), domain = c(-Inf, Inf)) {
  if (is.character(transform)) transform <- match.fun(transform)
  if (is.character(inverse)) inverse <- match.fun(inverse)
  if (is.character(d_transform)) d_transform <- match.fun(d_transform)
  if (is.character(d_inverse)) d_inverse <- match.fun(d_inverse)

  structure(
    list(
      name = name,
      transform = transform,
      inverse = inverse,
      d_transform = d_transform,
      d_inverse = d_inverse,
      breaks = breaks,
      minor_breaks = minor_breaks,
      format = format,
      domain = domain
    ),
    class = "transform"
  )
}

#' @rdname new_transform
#' @export
trans_new <- new_transform

#' @rdname new_transform
#' @export
is.transform <- function(x) inherits(x, "transform")

#' @export
#' @rdname new_transform
is.trans <- is.transform

#' @export
print.transform <- function(x, ...) {
  cat("Transformer: ", x$name, " [", x$domain[[1]], ", ", x$domain[[2]], "]\n", sep = "")
  invisible(x)
}

#' @export
plot.transform <- function(x, y, ..., xlim, ylim = NULL) {
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
lines.transform <- function(x, ..., xlim) {
  xgrid <- seq(xlim[1], xlim[2], length = 100)
  y <- suppressWarnings(x$transform(xgrid))

  graphics::lines(xgrid, y, ...)
}

#' @rdname new_transform
#' @export
as.transform <- function(x, arg = deparse(substitute(x))) {
  if (is.transform(x)) {
    x
  } else if (is.character(x) && length(x) >= 1) {
    if (length(x) == 1) {
      f <- paste0("transform_", x)
      # For backward compatibility
      fun <- get0(f, mode = "function")
      if (is.null(fun)) {
        f2 <- paste0(x, "_trans")
        fun <- get0(f2, mode = "function")
      }
      if (is.null(fun)) {
        cli::cli_abort("Could not find any function named {.fun {f}} or {.fun {f2}}")
      }
      fun()
    } else {
      transform_compose(!!!x)
    }
  } else {
    cli::cli_abort(sprintf("{.arg %s} must be a character vector or a transformer object", arg))
  }
}

#' @export
#' @rdname new_transform
as.trans <- as.transform

#' Compute range of transformed values
#'
#' Silently drops any ranges outside of the domain of `transform`.
#'
#' @param transform a transformation object, or the name of a transformation object
#'   given as a string.
#' @param x a numeric vector to compute the range of
#' @export
#' @keywords internal
trim_to_domain <- function(transform, x) {
  transform <- as.transform(transform)
  range(transform$transform(range(squish(x, transform$domain), na.rm = TRUE)))
}

#' @export
#' @rdname trim_to_domain
trans_range <- trim_to_domain
