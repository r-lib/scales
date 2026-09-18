#' Sequence palette
#'
#' Creates a regular sequence between two numbers.
#'
#' @param min Scalar number setting the start.
#' @param max Scalar number setting the end.
#'
#' @returns A discrete palette.
#' @export
pal_seq <- function(min = 0, max = 1) {
  force_all(min, max)
  new_discrete_palette(
    function(n) seq(min, max, length.out = n),
    type = "numeric"
  )
}
