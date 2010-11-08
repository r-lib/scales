size_palette <- function(to = c(1, 6)) {
  function(x) rescale(x, to, c(0, 1))
}
