.known_palettes <- new_environment(parent = empty_env())

get_palette <- function(name, ...) {

  name <- tolower(name)
  if (!exists(name, envir = .known_palettes)) {
    cli::cli_abort("Unknown palette: {name}")
  }

  pal <- env_get(.known_palettes, name)

  # Palette could be factory, in which case we want the product, or
  # palette can be a palette function that isn't registered as such,
  # in which case we want the colours it gives
  if (is_function(pal) && !is_pal(pal)) {
    pal <- try_fetch(
      pal(...),
      error = function(cnd) {
        cli::cli_abort("Failed to interpret {name} as palette.", parent = cnd)
      }
    )
  }
  if (is.character(pal)) {
    pal <- manual_pal(pal, type = "colour")
  }
  if (is_pal(pal)) {
    return(pal)
  }
  cli::cli_abort("Failed to interpret {name} as palette.")
}

set_palette <- function(name, palette, warn_conflict = TRUE) {
  name <- tolower(name)
  if (!is_function(palette) && !is_character(palette)) {
    cli::cli_abort(
      "The {.arg palette} argument must be a {.cls function} or \\
      {.cls character} vector."
    )
  }
  if (warn_conflict & exists(name, envir = .known_palettes)) {
    cli::cli_warn("Overwriting pre-existing {.val {name}} palette.")
  }
  env_bind(.known_palettes, !!name := palette)
  invisible(NULL)
}

palette_names <- function() {
  names(.known_palettes)
}

reset_palettes <- function() {
  env_unbind(.known_palettes, palette_names())
}
