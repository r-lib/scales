#' Continuous scale.
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
#'  \Sexpr[results=rd,stage=build]{scales:::seealso_trans()}.
#' @export
#' @examples
#' with(mtcars, plot(disp, mpg, cex = cscale(hp, rescale_pal())))
#' with(mtcars, plot(disp, mpg, cex = cscale(hp, rescale_pal(),
#'   trans = sqrt_trans())))
#' with(mtcars, plot(disp, mpg, cex = cscale(hp, area_pal())))
#' with(mtcars, plot(disp, mpg, pch = 20, cex = 5,
#'   col = cscale(hp, seq_gradient_pal("grey80", "black"))))
cscale <- function(x, palette, na.value = NA_real_, trans = identity_trans()) {
  stopifnot(is.trans(trans))

  x <- trans$transform(x)
  limits <- train_continuous(x)
  map_continuous(palette, x, limits, na.value)
}

#' Train (update) a continuous scale
#'
#' @inheritParams train_discrete
#' @export
train_continuous <- function(new, existing = NULL) {
  if (is.null(new)) return(existing)

  if (is.factor(new) || !typeof(new) %in% c("integer", "double")) {
    stop("Discrete value supplied to continuous scale",  call. = FALSE)
  }
  suppressWarnings(range(existing, new, na.rm = TRUE, finite = TRUE))
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

