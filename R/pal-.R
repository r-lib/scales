# Constructors ------------------------------------------------------------

new_continuous_palette <- function(fun, type, na_safe = NA) {
  if (!is.function(fun)) {
    cli::cli_abort("{.arg fun} must be a function.")
  }
  class(fun) <- union(class(fun), "pal_continuous")
  attr(fun, "type") <- type
  attr(fun, "na_safe") <- na_safe
  fun
}

new_discrete_palette <- function(fun, type, nlevels = NA) {
  if (!is.function(fun)) {
    cli::cli_abort("{.arg fun} must be a function.")
  }
  class(fun) <- union(class(fun), "pal_discrete")
  attr(fun, "type") <- type
  attr(fun, "nlevels") <- nlevels
  fun
}


# Testing -----------------------------------------------------------------

is_pal <- function(x) is_continuous_pal(x) || is_discrete_pal(x)
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
  attr(pal, "nlevels") %||% NA_integer_
}
palette_na_safe <- function(pal) {
  attr(pal, "na_safe") %||% FALSE
}
palette_type <- function(pal) {
  attr(pal, "type") %||% NA_character_
}
