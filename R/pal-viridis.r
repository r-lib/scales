#' Viridis palette
#'
#' @inheritParams viridisLite::viridis
#' @references <https://bids.github.io/colormap/>
#' @export
#' @examples
#' show_col(viridis_pal()(10))
#' show_col(viridis_pal(direction = -1)(6))
#' show_col(viridis_pal(begin = 0.2, end = 0.8)(4))
#' show_col(viridis_pal(option = "plasma")(6))
viridis_pal <- function(alpha = 1, begin = 0, end = 1, direction = 1, option= "D") {
  force_all(alpha, begin, end, direction, option)
  function(n) {
    viridisLite::viridis(n, alpha, begin, end, direction, option)
  }
}
