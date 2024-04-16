# Constructors ------------------------------------------------------------

new_continuous_palette <- function(fun, type, na_safe = NA) {
  if (!is.function(fun)) {
    cli::cli_abort("{.arg fun} must be a function.")
  }
  class(fun) <- union("pal_continuous", class(fun))
  attr(fun, "type") <- type
  attr(fun, "na_safe") <- na_safe
  fun
}

new_discrete_palette <- function(fun, type, nlevels = NA) {
  if (!is.function(fun)) {
    cli::cli_abort("{.arg fun} must be a function.")
  }
  class(fun) <- union("pal_discrete", class(fun))
  attr(fun, "type") <- type
  attr(fun, "nlevels") <- nlevels
  fun
}


# Testing -----------------------------------------------------------------

is_pal <- function(x) inherits(x, c("pal_discrete", "pal_continuous"))
is_continuous_pal <- function(x) inherits(x, "pal_continuous")
is_discrete_pal <- function(x) inherits(x, "pal_discrete")

is_colour_pal <- function(x) {
  is_pal(x) && any(palette_type(x) %in% c("color", "colour"))
}
is_numeric_pal <- function(x) {
  is_pal(x) && any(palette_type(x) %in% c("numeric", "double", "integer"))
}

# Getters -----------------------------------------------------------------

palette_nlevels <- function(pal) {
  as.integer(attr(pal, "nlevels")[1] %||% NA_integer_)
}
palette_na_safe <- function(pal) {
  as.logical(attr(pal, "na_safe")[1] %||% FALSE)
}
palette_type <- function(pal) {
  as.character(attr(pal, "type")[1] %||% NA_character_)
}

# Coercion ----------------------------------------------------------------

## As discrete palette ----------------------------------------------------

as_discrete_pal <- function(x, ...) {
  UseMethod("as_discrete_pal")
}

as_discrete_pal.default <- function(x, ...) {
  cli::cli_abort("Cannot convert {.arg x} to a discrete palette.")
}

as_discrete_pal.function <- function(x, ...) {
  x
}

as_discrete_pal.pal_continuous <- function(x, ...) {
  force(x)
  new_discrete_palette(
    function(n) x(seq(0, 1, length.out = n)),
    type = palette_type(x), nlevels = 255
  )
}

## As continuous palette --------------------------------------------------

as_continuous_pal <- function(x, ...) {
  UseMethod("as_continuous_pal")
}

as_continuous_pal.default <- function(x, ...) {
  cli::cli_abort("Cannot convert {.arg x} to a continuous palette.")
}

as_continuous_pal.function <- function(x, ...) {
  x
}

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
    color = , colour = colour_ramp(x(nlevels)),
    numeric = new_continuous_palette(
      approxfun(seq(0, 1, length.out = nlevels), x(nlevels)),
      type = "numeric", na_safe = FALSE
    ),
    cli::cli_abort(
      "Don't know how to convert a discrete {.field {type}} palette to \\
      a continuous palette."
    )
  )
}
