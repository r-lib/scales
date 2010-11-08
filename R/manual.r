manual_palette <- function(values) {
  function(n) values[seq_len(n)]
}
