.known_palettes <- new_environment(parent = empty_env())

#' Known palettes
#'
#' The scales packages keeps track of a set of palettes it considers 'known'.
#' The benefit of a known palette is that it can be called by name in functions
#' as `as_continuous_pal()` or `as_discrete_pal()`.
#'
#' @param name A string giving the palette name.
#' @param palette A [palette][new_continuous_palette], `function` or character
#'   vector.
#' @param warn_conflict A boolean which if `TRUE` (default), warns when
#'   replacing a known palette.
#' @param ... Additional arguments to pass to palette when it is a function
#'   but not a palette class function.
#'
#' @return The `get_palette()` function returns a palette. The `set_palette()`
#'   function is called for side effects and returns nothing.
#' @noRd
#'
#' @examples
#' # Get one of the known palettes
#' get_palette("hue")
#'
#' # Set a new custom palette
#' cols <- c("palegreen", "deepskyblue", "magenta")
#' set_palette("aurora", palette = cols)
#'
#' # Palette is now known
#' "aurora" %in% palette_names()
#' as_continuous_pal("aurora")
#'
#' # Resetting palettes
#' reset_palettes()
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
  init_palettes()
}

init_palettes <- function() {
  register_hcl_pals()
  register_base_pals()
  register_viridis_pals()
  register_brewer_pals()
  register_dichromat_pals()
  set_palette("grey", pal_grey, warn_conflict = FALSE)
  set_palette("hue", pal_hue, warn_conflict = FALSE)
}

on_load(init_palettes())

register_hcl_pals <- function(n = 31) {
  names <- grDevices::hcl.pals()
  for (name in names) {
    fun <- colour_ramp(grDevices::hcl.colors(n, palette = name))
    set_palette(name, fun, warn_conflict = FALSE)
  }
  invisible(NULL)
}

register_base_pals <- function() {
  if (getRversion() < "4.0.0") {
    return(invisible(NULL))
  }
  names <- utils::getFromNamespace("palette.pals", "grDevices")()
  palette <- utils::getFromNamespace("palette.colors", "grDevices")
  for (name in names) {
    fun <- manual_pal(palette(palette = name), type = "colour")
    set_palette(name, fun, warn_conflict = FALSE)
  }
  invisible(NULL)
}

register_viridis_pals <- function() {
  names <- c(
    "magma",
    "inferno",
    "plasma",
    "viridis",
    "cividis",
    "rocket",
    "mako",
    "turbo"
  )
  for (name in names) {
    fun <- pal_viridis(option = name)
    set_palette(name, fun, warn_conflict = FALSE)
  }
  invisible(NULL)
}

register_brewer_pals <- function() {
  names <- rownames(RColorBrewer::brewer.pal.info)
  for (name in names) {
    fun <- pal_brewer(palette = name)
    set_palette(name, fun, warn_conflict = FALSE)
  }
  invisible(NULL)
}

register_dichromat_pals <- function() {
  if (!is_installed("dichromat")) {
    return(invisible(NULL))
  }
  names <- names(dichromat::colorschemes)
  for (name in names) {
    fun <- manual_pal(dichromat::colorschemes[[name]], type = "colour")
    set_palette(name, fun, warn_conflict = FALSE)
  }
  invisible(NULL)
}
