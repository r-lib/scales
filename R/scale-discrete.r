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

discrete_range <- function(..., drop = FALSE) {
  levels <- lapply(list(...), clevels, drop = drop)

  all <- unique(unlist(levels))
  if (is.numeric(all)) {
    all <- all[order(all)]
    all <- as.character(all)
  }
  
  all
}

clevels <- function(x, drop = FALSE) {
  if (is.null(x)) return(character())
  
  if (is.factor(x)) {
    if (drop) x <- factor(x)
    values <- levels(x)
  } else if (is.numeric(x)) {
    values <- unique(x)
  } else {
    values <- as.character(unique(x)) 
  }
  if (any(is.na(x))) values <- c(values, NA)
  values
}

map_discrete <- function(palette, x, limits, na.value = NA) {
  n <- length(limits)
  pal <- palette(n)[match(as.character(x), limits)]
  ifelse(!is.na(x), pal, na.value)
}