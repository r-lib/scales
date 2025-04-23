#' Interpolated labels
#'
#' Use `label_glue()` to perform string interpolation using the \pkg{glue}
#' package. Enclosed expressions will be evaluated as R code.
#'
#' @inherit label_number return
#' @param pattern A glue string used for formatting. The `x` variable holds the
#'   breaks, so that `"{x}"` (default) returns the breaks as-is.
#' @param ... Arguments passed on to [`glue::glue()`].
#' @param parse Whether to return labels as expressions.
#' @inheritParams glue::glue
#' @export
#' @family labels for continuous scales
#' @family labels for discrete scales
#'
#' @examples
#' # Example variables
#' animal  <- "penguin"
#' species <- c("Adelie",  "Chinstrap", "Emperor", "Gentoo")
#'
#' # Typical use, note that {x} will become the breaks
#' demo_discrete(species, labels = label_glue("The {x}\n{animal}"))
#' # It adapts to the breaks that are present
#' demo_discrete(species[-3], labels =  label_glue("The {x}\n{animal}"))
#' # Contrary to directly glueing species + animal, which results in mislabelling!
#' demo_discrete(species[-3], labels = glue::glue("The {species}\n{animal}"))
label_glue <- function(
  pattern = "{x}",
  ...,
  parse = FALSE,
  .envir = caller_env()
) {
  args <- list2(...)
  force_all(pattern, parse, .envir)
  function(x) {
    x <- inject(glue::glue_data(list(x = x), pattern, !!!args, .envir = .envir))
    if (parse) {
      x <- parse_safe(x)
    }
    x
  }
}
