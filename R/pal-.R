#' @name palette-recommendations
#' @title Recommendations for colour palettes
#' @description
#' For the purposes of these recommendations, we define a palette as a function
#' that either takes an `n` argument for the number of desired output colours or
#' a `value` argument between 0-1 representing how far along a gradient output
#' colours should be. The palette then returns a number of colours equal to `n`
#' or `length(x)`.
#'
#' The convention in the scales package is to name functions that generate
#' palettes (palette factories) with the `pal_`-prefix. The benefit of
#' factories is that you can easily parameterise palettes, for example giving
#' options for how a palette should be constructed.
#'
#' In the example below `pal_aurora()` is a palette factory parameterised by
#' a `direction` argument.
#'
#' ```r
#' pal_aurora <- function(direction = 1) {
#'   colours <- c("palegreen", "deepskyblue", "magenta")
#'   if (sign(direction) == -1) {
#'     colours <- rev(colours)
#'   }
#'   pal_manual(colours, type = "colour")
#' }
#'
#' class(pal_aurora())
#' #> [1] "pal_discrete" "scales_pal"   "function"
#' ```
#'
#' It is recommended that a palette factory returns a function with either the
#' `pal_discrete` or `pal_continuous` class. If your factory constructs a
#' plain vector of colours, then `pal_manual(type = "colour")` or
#' `pal_gradient_n()` are useful to return a classed palette for this common
#' use case.
#'
#' When your inner palette function does not return a defined vector of colours,
#' it is recommended to use `new_discrete_palette` and `new_continuous_palette`
#' instead and supplement the additional `type` and `na_safe`/`nlevels`
#' properties. This should allow easy translation between discrete and
#' continuous palettes.
#'
#' ```r
#' pal_random <- function() {
#'   fun <- function(n) {
#'     sample(colours(distinct = TRUE), size = n)
#'   }
#'   new_discrete_palette(fun, type = "colour", nlevels = length(colours()))
#' }
#' ```
#'
#' If you don't have parameterised palettes, but also if you have palette
#' factories, it is encouraged to export an (inner) palette function or
#' plain colour vector. This is in addition to exporting the palette factory.
#' Exporting this makes it easy for users to specify for example
#' `as_continuous_pal(mypackage::aurora)`.
#'
#' ```
#' #' @export
#' aurora <- pal_aurora()
#'
#' # or:
#'
#' #' @export
#' aurora <- c("palegreen", "deepskyblue", "magenta")
#' ```
#'
#' Lastly, for testing purposes we encourage that your palettes can be
#' interpreted both as discrete palette, but also a continuous palette.
#' To test for  this, you can test the output of `as_discrete_pal()` and
#' `as_continuous_pal()`.
#'
#' ```r
#' test_that("pal_aurora can be discrete or continuous", {
#'
#'   my_pal <- pal_aurora()
#'   colours <- c("palegreen", "deepskyblue", "magenta")
#'
#'   expect_equal(as_discrete_pal(my_pal)(3), colours)
#'   expect_equal(as_continuous_pal(my_pal)(c(0, 0.5, 1)), alpha(colours, NA))
#'
#' })
#' ```
#' @seealso [palette utilities][new_continuous_palette]
NULL

# Constructors ------------------------------------------------------------

#' Constructors for palettes
#'
#' These constructor functions attach metadata to palette functions. This
#' metadata can be used in testing or coercion.
#'
#' @param fun A function to serve as a palette. For continuous palettes, these
#'   typically take vectors of numeric values between (0, 1) and return a
#'   vector of equal length. For discrete palettes, these typically take a
#'   scalar integer and return a vector of that length.
#' @param type A string giving the type of return values. Some example strings
#'   include `"colour"`, `"numeric"`, `"linetype"` or `"shape"`.
#' @param na_safe A boolean indicating whether `NA` values are translated to
#'   palette values (`TRUE`) or are kept as `NA` (`FALSE`). Applies to
#'   continuous palettes.
#' @param nlevels An integer giving the number of distinct palette values
#'   that can be returned by the discrete palette.
#' @param x An object to test or coerce.
#' @param pal A palette to retrieve properties from.
#' @param ... Additional arguments. Currently not in use.
#'
#' @return
#' For `new_continuous_palette()`, `new_discret_palette()`, `as_discrete_pal()`
#' and `as_continuous_pal()`: a function of class `pal_continuous` or `pal_discrete`.
#' For `is_pal()`, `is_continuous_pal()`, `is_discret_pal()`, `is_colour_pal()`,
#' or `is_numeric_pal()`: a logical value of length 1.
#' For `palette_nlevels()` a single integer. For `palette_na_safe()` a boolean.
#' For `palette_type()` a string.
#' @export
#' @seealso [palette recommendations][palette-recommendations]
#'
#' @examples
#' # Creating a new discrete palette
#' new_discrete_palette(
#'   fun = grDevices::terrain.colors,
#'   type = "colour", nlevels = 255
#' )
#'
#' # Creating a new continuous palette
#' new_continuous_palette(
#'   fun = function(x) rescale(x, to = c(1, 0)),
#'   type = "numeric", na_safe = FALSE
#' )
#'
#' # Testing palette properties
#' is_continuous_pal(pal_seq_gradient())
#' is_discrete_pal(pal_viridis())
#' is_numeric_pal(pal_area())
#' is_colour_pal(pal_manual(c("red", "green")))
#' is_pal(transform_log10())
#'
#' # Extracting properties
#' palette_nlevels(pal_viridis())
#' palette_na_safe(colour_ramp(c("red", "green"), na.color = "grey50"))
#' palette_type(pal_shape())
#'
#' # Switching discrete to continuous
#' pal <- as_continuous_pal(pal_viridis())
#' show_col(pal(c(0, 0.1, 0.2, 0.4, 1)))
#'
#' # Switching continuous to discrete
#' pal <- as_discrete_pal(pal_div_gradient())
#' show_col(pal(9))
new_continuous_palette <- function(fun, type, na_safe = NA) {
  check_function(fun)
  class(fun) <- union(c("pal_continuous", "scales_pal"), class(fun))
  attr(fun, "type") <- type
  attr(fun, "na_safe") <- na_safe
  fun
}

#' @rdname new_continuous_palette
#' @export
new_discrete_palette <- function(fun, type, nlevels = NA) {
  check_function(fun)
  class(fun) <- union(c("pal_discrete", "scales_pal"), class(fun))
  attr(fun, "type") <- type
  attr(fun, "nlevels") <- nlevels
  fun
}

# Testing -----------------------------------------------------------------

#' @rdname new_continuous_palette
#' @export
is_pal <- function(x) inherits(x, c("pal_discrete", "pal_continuous"))

#' @rdname new_continuous_palette
#' @export
is_continuous_pal <- function(x) inherits(x, "pal_continuous")

#' @rdname new_continuous_palette
#' @export
is_discrete_pal <- function(x) inherits(x, "pal_discrete")

#' @rdname new_continuous_palette
#' @export
is_colour_pal <- function(x) {
  is_pal(x) && any(palette_type(x) %in% c("color", "colour"))
}

#' @rdname new_continuous_palette
#' @export
is_numeric_pal <- function(x) {
  is_pal(x) && any(palette_type(x) %in% c("numeric", "double", "integer"))
}

# Getters -----------------------------------------------------------------

#' @rdname new_continuous_palette
#' @export
palette_nlevels <- function(pal) {
  as.integer(attr(pal, "nlevels")[1] %||% NA_integer_)
}
#' @rdname new_continuous_palette
#' @export
palette_na_safe <- function(pal) {
  as.logical(attr(pal, "na_safe")[1] %||% FALSE)
}
#' @rdname new_continuous_palette
#' @export
palette_type <- function(pal) {
  as.character(attr(pal, "type")[1] %||% NA_character_)
}

# Coercion ----------------------------------------------------------------

## As discrete palette ----------------------------------------------------

#' @rdname new_continuous_palette
#' @export
as_discrete_pal <- function(x, ...) {
  UseMethod("as_discrete_pal")
}

#' @export
as_discrete_pal.default <- function(x, ...) {
  cli::cli_abort("Cannot convert {.arg x} to a discrete palette.")
}

#' @export
as_discrete_pal.function <- function(x, ...) {
  x
}

#' @export
as_discrete_pal.pal_continuous <- function(x, ...) {
  force(x)
  new_discrete_palette(
    function(n) x(seq(0, 1, length.out = n)),
    type = palette_type(x),
    nlevels = 255
  )
}

#' @export
as_discrete_pal.character <- function(x, ...) {
  if (length(x) > 1) {
    return(pal_manual(x))
  }
  as_discrete_pal(get_palette(x, ...))
}

## As continuous palette --------------------------------------------------

#' @rdname new_continuous_palette
#' @export
as_continuous_pal <- function(x, ...) {
  UseMethod("as_continuous_pal")
}

#' @export
as_continuous_pal.default <- function(x, ...) {
  cli::cli_abort("Cannot convert {.arg x} to a continuous palette.")
}

#' @export
as_continuous_pal.function <- function(x, ...) {
  x
}

#' @export
as_continuous_pal.pal_discrete <- function(x, ...) {
  nlevels <- palette_nlevels(x)
  if (!is_scalar_integerish(nlevels, finite = TRUE)) {
    cli::cli_abort(c(
      "Cannot convert {.arg x} to continuous palette.",
      i = "Unknown number of supported levels."
    ))
  }
  type <- palette_type(x)
  switch(
    type,
    color = ,
    colour = colour_ramp(x(nlevels)),
    numeric = new_continuous_palette(
      stats::approxfun(seq(0, 1, length.out = nlevels), x(nlevels)),
      type = "numeric",
      na_safe = FALSE
    ),
    cli::cli_abort(
      "Don't know how to convert a discrete {.field {type}} palette to \\
      a continuous palette."
    )
  )
}

#' @export
as_continuous_pal.character <- function(x, ...) {
  if (length(x) > 1) {
    return(colour_ramp(x))
  }
  as_continuous_pal(get_palette(x, ...))
}

# Utility -----------------------------------------------------------------

#' @export
plot.pal_discrete <- function(x, y, ..., n_max = 25) {
  show_col(x(pmin(n_max, palette_nlevels(x))), ...)
}

#' @export
plot.pal_continuous <- function(x, y, ..., n_max = 25) {
  show_col(x(seq(0, 1, length.out = n_max)), ...)
}
