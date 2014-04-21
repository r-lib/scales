#' Color Brewer palette (discrete).
#'
#' @param type One of seq (sequential), div (diverging) or qual (qualitative)
#' @param palette If a string, will use that named palette.  If a number, will
#'   index into the list of palettes of appropriate \code{type}
#' @references \url{http://colorbrewer2.org}
#' @export
#' @examples
#' show_col(brewer_pal()(10))
#' show_col(brewer_pal("div")(5))
#' show_col(brewer_pal(pal = "Greens")(5))
#'
#' # Can use with gradient_n to create a continous gradient
#' cols <- brewer_pal("div")(5)
#' show_col(gradient_n_pal(cols)(seq(0, 1, length = 30)))
brewer_pal <- function(type = "seq", palette = 1) {
  pal <- pal_name(palette, type)

  # If <3 colors are requested, brewer.pal will return a 3-color palette and
  # give a warning. This warning isn't useful, so suppress it.
  # If the palette has k colors and >k colors are requested, brewer.pal will
  # return a k-color palette and give a warning. This warning is useful, so
  # don't suppress it. In both cases, the seq_len(n) is there to make sure
  # that the n items are returned, even if brewer.pal returns a different
  # number of items.
  function(n) {
    if (n < 3)
      suppressWarnings(RColorBrewer::brewer.pal(n, pal))[seq_len(n)]
    else
      RColorBrewer::brewer.pal(n, pal)[seq_len(n)]
  }
}

pal_name <- function(palette, type) {
  if (is.character(palette)) {
    if (!palette %in% unlist(brewer)) {
      warning("Unknown palette ", palette)
      palette <- "Greens"
    }
    return(palette)
  }

  type <- match.arg(type, c("div", "qual", "seq"))
  brewer[[type]][palette]
}

brewer <- list(
  div = c("BrBG", "PiYG", "PRGn", "PuOr", "RdBu", "RdGy", "RdYlBu", "RdYlGn",
    "Spectral"),
  qual = c("Accent", "Dark2", "Paired", "Pastel1", "Pastel2", "Set1",
    "Set2", "Set3"),
  seq = c("Blues", "BuGn", "BuPu", "GnBu", "Greens", "Greys", "Oranges",
    "OrRd", "PuBu", "PuBuGn", "PuRd", "Purples", "RdPu", "Reds",
    "YlGn", "YlGnBu", "YlOrBr", "YlOrRd")
)
