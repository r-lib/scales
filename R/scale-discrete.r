#' Discrete scale.
#'
#' @param x vector of discrete values to scale
#' @param palette aesthetic palette to use
#' @param na.value aesthetic to use for missing values
#' @export
#' @examples
#' with(mtcars, plot(disp, mpg, pch = 20, cex = 3,
#'   col = dscale(factor(cyl), brewer_pal())))
dscale <- function(x, palette, na.value = NA) {
  limits <- train_discrete(x)
  map_discrete(palette, x, limits, na.value)
}

is.discrete <- function(x) {
  is.factor(x) || is.character(x) || is.logical(x)
}

#' Train (update) a discrete scale
#'
#' @param new New data to add to scale
#' @param existing Optional existing scale to update
#' @param drop `TRUE`, will drop factor levels not associated with data
#' @param na.rm If `TRUE`, will remove missing values
#' @export
train_discrete <- function(new, existing = NULL, drop = FALSE, na.rm = FALSE) {
  if (is.null(new)) return(existing)

  if (!is.discrete(new)) {
    stop("Continuous value supplied to discrete scale", call. = FALSE)
  }
  discrete_range(existing, new, drop = drop, na.rm = na.rm)
}

discrete_range <- function(old, new, drop = FALSE, na.rm = FALSE) {
  new <- clevels(new, drop = drop, na.rm = na.rm)
  if (is.null(old)) return(new)
  if (!is.character(old)) old <- clevels(old, na.rm = na.rm)

  new_levels <- setdiff(new, as.character(old))

  # Keep as a factor if we don't have any new levels
  if (length(new_levels) == 0) {
    return(old)
  }

  sort(c(old, new_levels))
}

clevels <- function(x, drop = FALSE, na.rm = FALSE) {
  if (is.null(x)) {
    character()
  } else if (is.factor(x)) {
    if (drop) x <- factor(x)

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
