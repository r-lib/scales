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
