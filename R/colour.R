col2rgb <- function(x, alpha = FALSE) {
  out <- t(grDevices::col2rgb(x, alpha = alpha))
  colnames(out) <- c("r", "g", "b", if (alpha) "alpha")
  rownames(out) <- names(x)
  out[is.na(x), ] <- NA
  out
}

rgb2col <- function(x, na_colour = NA) {
  # Round to integers [0, 255]
  x[] <- pmin(pmax(0, round(x)), 255)

  na <- !stats::complete.cases(x)

  if (ncol(x) == 4) {
    if (all(x[!na, 4] == 255L)) {
      alpha <- NULL
    } else {
      alpha <- x[, 4]
    }
  } else {
    alpha <- NULL
  }

  out <- rep(NA_character_, nrow(x))
  names(out) <- rownames(x)

  out[!na] <- grDevices::rgb(
    x[!na, , drop = FALSE],
    alpha = alpha,
    maxColorValue = 255
  )

  out[na] <- na_colour
  out
}
