# each value of x is assigned a suffix and associated scaling factor
rescale_by_suffix <- function(x, breaks) {
  min_suffix <- names(which.min(breaks))
  suffix <- as.character(cut(
    abs(x),
    breaks = c(-Inf, unname(breaks), Inf),
    labels = c(min_suffix, names(breaks)),
    right = FALSE
  ))

  scale <- unname(1 / breaks[suffix])
  scale[which(scale %in% c(Inf, NA))] <- 1

  # exact zero is not scaled
  x_zero <- which(abs(x) == 0)
  scale[x_zero] <- 1
  suffix[x_zero] <- ""

  list(scale = scale, suffix = suffix)
}
