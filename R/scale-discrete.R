#' Discrete scale
#'
#' @param x vector of discrete values to scale
#' @param palette aesthetic palette to use
#' @param na.value aesthetic to use for missing values
#' @export
#' @examples
#' with(mtcars, plot(disp, mpg,
#'   pch = 20, cex = 3,
#'   col = dscale(factor(cyl), pal_brewer())
#' ))
dscale <- function(x, palette, na.value = NA) {
  limits <- train_discrete(x)
  map_discrete(palette, x, limits, na.value)
}

is.discrete <- function(x) {
  !is.null(levels(x)) || is.character(x) || is.logical(x)
}

#' Train (update) a discrete scale
#'
#' @param new New data to add to scale
#' @param existing Optional existing scale to update
#' @param drop `TRUE`, will drop factor levels not associated with data
#' @param na.rm If `TRUE`, will remove missing values
#' @param fct Treat `existing` as if it came from a factor (ie. don't sort the range)
#' @param call A call to display in error messages
#' @export
train_discrete <- function(
  new,
  existing = NULL,
  drop = FALSE,
  na.rm = FALSE,
  fct = NA,
  call = caller_env()
) {
  if (is.null(new)) {
    return(existing)
  }
  if (!is.discrete(new)) {
    example <- unique(new)
    example <- example[seq_len(pmin(length(example), 5))]
    cli::cli_abort(
      c(
        "Continuous value supplied to a discrete scale.",
        i = "Example values: {.and {.val {example}}}."
      ),
      call = call
    )
  }
  discrete_range(existing, new, drop = drop, na.rm = na.rm, fct = fct)
}

discrete_range <- function(old, new, drop = FALSE, na.rm = FALSE, fct = NA) {
  new_is_factor <- is.factor(new)
  old_is_factor <- is.factor(old) || isTRUE(fct)
  new <- clevels(new, drop = drop, na.rm = na.rm)
  if (is.null(old)) {
    return(new)
  }

  if (old_is_factor && !is.factor(old)) {
    old <- factor(old, old)
  }
  if (!is.character(old)) {
    old <- clevels(old, na.rm = na.rm)
  } else {
    old <- sort(old, na.last = if (na.rm) NA else TRUE)
  }

  # If new is more rich than old it becomes the primary
  if (new_is_factor && !old_is_factor) {
    tmp <- old
    old <- new
    new <- tmp
    tmp <- old_is_factor
    old_is_factor <- new_is_factor
    new_is_factor <- tmp
  }

  new_levels <- setdiff(new, old)

  # Keep as a factor if we don't have any new levels
  if (length(new_levels) == 0) {
    return(old)
  }

  range <- c(old, new_levels)

  # Avoid sorting levels when dealing with factors. `old` will always be a
  # factor if either `new` or `old` was a factor going in
  if (old_is_factor) {
    return(range)
  }
  sort(range, na.last = if (na.rm) NA else TRUE)
}

clevels <- function(x, drop = FALSE, na.rm = FALSE) {
  if (is.null(x)) {
    character()
  } else if (!is.null(levels(x))) {
    if (drop && !is.character(x)) x <- droplevels(x)

    values <- levels(x)
    if (na.rm) {
      values <- values[!is.na(values)]
    } else if (any(is.na(x))) {
      values <- c(values, NA)
    }

    values
  } else {
    sort(unique(x), na.last = if (na.rm) NA else TRUE)
  }
}

map_discrete <- function(palette, x, limits, na.value = NA) {
  n <- length(limits)
  pal <- palette(n)[match(as.character(x), limits)]
  ifelse(!is.na(x), pal, na.value)
}
