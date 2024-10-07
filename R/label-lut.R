
label_lut <- function(lut = character(), nomatch = NULL) {

  if (!is.character(lut)) {
    cli::cli_abort("The {.arg lut} argument must be a character vector.")
  }
  if (!is_named2(lut)) {
    cli::cli_abort("The {.arg lut} argument must have names.")
  }
  names <- names(lut)
  values <- unname(lut)

  force(nomatch)

  function(x) {
    i <- match(x, names, nomatch = NA_integer_)
    out <- values[i]
    missing <- is.na(i)
    out[missing] <- if (is.null(nomatch)) x[missing] else nomatch
    out
  }
}
