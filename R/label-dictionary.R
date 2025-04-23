#' Labels from lookup tables
#'
#' Use `label_dictionary()` for looking up succinct breaks in a named character
#' vector giving complete labels.
#'
#' @inherit label_number return
#' @param dictionary A named character vector of labels. The names are expected
#'   to match the breaks, and the values become the labels.
#' @param nomatch A string to label breaks that do not match any name in
#'  `dictionary`. When `NULL` (default), the breaks are not translated but are
#'  kept as-is.
#'
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
  if (!is.character(dictionary)) {
    cli::cli_abort("The {.arg dictionary} argument must be a character vector.")
  }
  if (!is_named2(dictionary)) {
    cli::cli_abort("The {.arg dictionary} argument must have names.")
  }
  names <- names(dictionary)
  values <- unname(dictionary)

  force(nomatch)

  function(x) {
    i <- match(x, names, nomatch = NA_integer_)
    out <- values[i]
    missing <- is.na(i)
    out[missing] <- if (is.null(nomatch)) x[missing] else nomatch
    out
  }
}
