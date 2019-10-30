#' Colour Brewer palette (discrete)
#'
#' @param type One of seq (sequential), div (diverging) or qual (qualitative)
#' @param palette If a string, will use that named palette.  If a number, will
#'   index into the list of palettes of appropriate `type`
#' @param direction Sets the order of colours in the scale. If 1, the default,
#'   colours are as output by [RColorBrewer::brewer.pal()]. If -1, the
#'   order of colours is reversed.
#' @references <http://colorbrewer2.org>
#' @export
#' @examples
#' show_col(brewer_pal()(10))
#' show_col(brewer_pal("div")(5))
#' show_col(brewer_pal(palette = "Greens")(5))
#'
#' # Can use with gradient_n to create a continous gradient
#' cols <- brewer_pal("div")(5)
#' show_col(gradient_n_pal(cols)(seq(0, 1, length.out = 30)))
brewer_pal <- function(type = "seq", palette = 1, direction = 1) {
  pal <- pal_name(palette, type)
  force(direction)
  function(n) {
    # If <3 colors are requested, brewer.pal will return a 3-color palette and
    # give a warning. This warning isn't useful, so suppress it.
    # If the palette has k colors and >k colors are requested, brewer.pal will
    # return a k-color palette and give a warning. This warning is useful, so
    # don't suppress it.
    if (n < 3) {
      pal <- suppressWarnings(RColorBrewer::brewer.pal(n, pal))
    } else {
      pal <- RColorBrewer::brewer.pal(n, pal)
    }
    # In both cases ensure we have n items
    pal <- pal[seq_len(n)]

    if (direction == -1) {
      pal <- rev(pal)
    }

    pal
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
  div = c(
    "BrBG", "PiYG", "PRGn", "PuOr", "RdBu", "RdGy", "RdYlBu", "RdYlGn",
    "Spectral"
  ),
  qual = c(
    "Accent", "Dark2", "Paired", "Pastel1", "Pastel2", "Set1",
    "Set2", "Set3"
  ),
  seq = c(
    "Blues", "BuGn", "BuPu", "GnBu", "Greens", "Greys", "Oranges",
    "OrRd", "PuBu", "PuBuGn", "PuRd", "Purples", "RdPu", "Reds",
    "YlGn", "YlGnBu", "YlOrBr", "YlOrRd"
  )
)
