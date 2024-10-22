
#' Labels from lookup tables
#'
#' Use `label_dictionary()` for looking up succinct breaks in a named character
#' vector giving complete labels.
#'
#' @param dictionary A named character vector of labels. The names are expected
#'   to match the breaks, and the values become the labels.
#' @param nomatch A string to label breaks that do not match any name in
#'  `dictionary`. When `NULL` (default), the breaks are not translated but are
#'  kept as-is.
#'
#' @return A labeller function that takes a character vector of breaks and
#'   returns a character vector of labels.
#' @export
#' @family labels for discrete scales
#' @examples
#' # Example lookup table
#' lut <- c(
#'   "4" = "four wheel drive",
#'   "r" = "rear wheel drive",
#'   "f" = "front wheel drive"
#' )
#'
#' # Typical usage
#' demo_discrete(c("4", "r", "f"), labels = label_dictionary(lut))
#' # By default, extra values ('w') will remain as-is
#' demo_discrete(c("4", "r", "f", "w"), labels = label_dictionary(lut))
#' # Alternatively, you can relabel extra values
#' demo_discrete(
#'   c("4", "r", "f", "w"),
#'   labels = label_dictionary(lut, nomatch = "unknown")
#' )
label_dictionary <- function(dictionary = character(), nomatch = NULL) {

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
