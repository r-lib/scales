col2rgb <- function(x, alpha = FALSE) {
  out <- t(grDevices::col2rgb(x, alpha = alpha))
  colnames(out) <- c("r", "g", "b", if (alpha) "alpha")
  rownames(out) <- names(x)
  out[is.na(x), ] <- NA
  out
}
