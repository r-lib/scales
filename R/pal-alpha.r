#' Alpha palette (continuous).
#'
#' @export
alpha_pal <- function(x, to = c(0.1, 1)) {
  rescale(x, to, c(0, 1))
}

#' Modify colour transparency.
#' Vectorised in both colour and alpha.
#' 
#' @param colour colour
#' @param alpha new alpha level in [0,1]
#' @examples
#' alpha("red", 0.1)
#' alpha(colours(), 0.5)
#' alpha("red", seq(0, 1, length = 10))
alpha <- function(colour, alpha) {
  alpha[is.na(alpha)] <- 0
  col <- col2rgb(colour, TRUE) / 255
  
  if (length(colour) != length(alpha)) {
    if (length(colour) > 1 && length(alpha) > 1) {
      stop("Only one of colour and alpha can be vectorised")
    }
    
    if (length(colour) > 1) {
      alpha <- rep(alpha, length.out = length(colour))    
    } else if (length(alpha) > 1) {
      col <- col[, rep(1, length(alpha)), drop = FALSE]
    }
  }
  # Only set if colour is opaque
  col[4, ] <- ifelse(col[4, ] == 1, alpha, col[4, ])

  new_col <- rgb(col[1,], col[2,], col[3,], col[4,])
  new_col[is.na(colour)] <- NA  
  new_col
}