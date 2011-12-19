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

train_discrete <- function(new, existing = NULL, drop = FALSE) {
  if (is.null(new)) return(existing)

  if (!is.discrete(new)) {
    stop("Continuous value supplied to discrete scale", call. = FALSE) 
  }
  discrete_range(existing, new, drop = drop)
}

discrete_range <- function(old, new, drop = FALSE) {
  new <- clevels(new, drop = drop)
  if (is.null(old)) return(new)
  if (!is.character(old)) old <- clevels(old)

  new_levels <- setdiff(new, as.character(old))
  
  # Keep as a factor if we don't have any new levels
  if (length(new_levels) == 0) {
    return(old)
  }
  
  sort(c(old, new_levels))
}

clevels <- function(x, drop = FALSE) {
  if (is.null(x)) {
    character()
  } else if (is.factor(x)) {
    if (drop) x <- factor(x)

    values <- levels(x)
    if (any(is.na(x))) values <- c(values, NA)
    
    values
  } else {
    sort(unique(x))
  }
}

map_discrete <- function(palette, x, limits, na.value = NA) {
  n <- length(limits)
  pal <- palette(n)[match(as.character(x), limits)]
  ifelse(!is.na(x), pal, na.value)
}
