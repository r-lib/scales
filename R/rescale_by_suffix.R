# each value of x is assigned a suffix and associated scaling factor
rescale_by_suffix <- function(x, breaks, scale = 1, accuracy = NULL, suffix = "", space = TRUE) {
  break_suffix <- as.character(cut(
    abs(x * scale),
    breaks = c(unname(breaks), Inf),
    labels = names(breaks),
    right = FALSE
  ))
  break_suffix[is.na(break_suffix)] <- names(which.min(breaks))

  scale <- scale * unname(1 / breaks[break_suffix])
  scale[which(scale %in% c(Inf, NA))] <- 1

  # exact zero is not scaled
  x_zero <- which(abs(x) == 0)
  scale[x_zero] <- 1
  break_suffix[x_zero] <- ""

  suffix <- paste0(if (space) " ", break_suffix, suffix)
  accuracy <- accuracy %||% ave(x * scale, scale, FUN = precision)

  list(
    scale = scale,
    suffix = suffix,
    accuracy = accuracy
  )
}
