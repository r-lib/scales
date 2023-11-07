#' Continuous scale
#'
#' @param x vector of continuous values to scale
#' @param palette palette to use.
#'
#'   Built in palettes:
#'   \Sexpr[results=rd,stage=build]{scales:::seealso_pal()}
#' @param na.value value to use for missing values
#' @param trans transformation object describing the how to transform the
#'  raw data prior to scaling.  Defaults to the identity transformation which
#'  leaves the data unchanged.
#'
#'  Built in transformations:
#'  \Sexpr[results=rd,stage=build]{scales:::seealso_transform()}.
#' @export
#' @examples
#' with(mtcars, plot(disp, mpg, cex = cscale(hp, pal_rescale())))
#' with(mtcars, plot(disp, mpg, cex = cscale(hp, pal_rescale(),
#'   trans = transform_sqrt()
#' )))
#' with(mtcars, plot(disp, mpg, cex = cscale(hp, pal_area())))
#' with(mtcars, plot(disp, mpg,
#'   pch = 20, cex = 5,
#'   col = cscale(hp, pal_seq_gradient("grey80", "black"))
#' ))
cscale <- function(x, palette, na.value = NA_real_, trans = transform_identity()) {
  if (!is.trans(trans)) cli::cli_abort("{.arg trans} must be a {.cls trans} object")

  x <- trans$transform(x)
  limits <- train_continuous(x)
  map_continuous(palette, x, limits, na.value)
}

#' Train (update) a continuous scale
#'
#' Strips attributes and always returns a numeric vector
#'
#' @inheritParams train_discrete
#' @export
train_continuous <- function(new, existing = NULL) {
  if (is.null(new)) {
    return(existing)
  }

  if (is.factor(new) || !typeof(new) %in% c("integer", "double")) {
    cli::cli_abort("Discrete value supplied to a continuous scale")
  }

  # Needs casting to numeric because some `new` vectors can misbehave when
  # combined with a NULL `existing` (#369)
  suppressWarnings(range(existing, as.numeric(new),
                         na.rm = TRUE, finite = TRUE))
}

# Map values for a continuous palette.
#
# @param oob out of bounds behaviour. Defaults to \code{\link{censor}}
#   which turns oob values into missing values.
map_continuous <- function(palette, x, limits, na.value = NA_real_, oob = censor) {
  x <- oob(rescale(x, from = limits))
  pal <- palette(x)
  ifelse(!is.na(x), pal, na.value)
}
