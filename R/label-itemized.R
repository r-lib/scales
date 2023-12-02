

#' Label categories like an itemized list
#'
#' `label_itemized` displays values using itemized list numbering
#' like `a, b, c` or `(1), (2), (3)`.
#'
#' @inherit label_number return
#' @param fmt A format string containing exactly one occurrence of either `"i"`,
#'   `"I"`, `"a"`, `"A"` or `"1"`.
#'
#' @details
#' Values are converted to integers.
#'
#' * If `fmt` contains `"a"`, values are labelled `a, b, c, ...`.
#' * If `fmt` contains `"A"`,  values are labelled `A, B, C, ...`.
#' * If `fmt` contains `"i"`,  values are labelled by Roman numerals
#'   `i, ii, iii, iv, ...`.
#' * If `fmt` contains `"I"`,  values are labelled `I, II, III, IV, ...`.
#' * If `fmt` contains `"1"`, values are labelled `1, 2, 3,...`.
#'
#' Other characters in `fmt` are passed through as-is, so e.g. `fmt = "a)"`
#' becomes `a), b), c), ...`.
#'
#' @export
#'
#' @examples
#' demo_continuous(1:5)
#' demo_continuous(1:5, labels = label_itemized())
#' demo_continuous(1:5, labels = label_itemized("(a)"))
#' demo_continuous(1:5, labels = label_itemized("i."))
label_itemized <- function (fmt = "a") {
  force_all(fmt)
  match <- gregexpr("(a|A|i|I|1)", fmt)[[1]]
  if (length(match) > 1 || match[1] == -1L) {
    abort("`fmt` must contain exactly one a/A/i/I/1 character")
  }

  key <- substr(fmt, match, match)
  before <- substr(fmt, 1, match - 1)
  after <- substr(fmt, match + 1, nchar(fmt))

  switch(key,
           "a" = itemized_alphabetic(before, after, caps = FALSE),
           "A" = itemized_alphabetic(before, after, caps = TRUE),
           "i" = itemized_roman(before, after, caps = FALSE),
           "I" = itemized_roman(before, after, caps = TRUE),
           "1" = itemized_numeral(before, after)
         )

}

itemized_alphabetic <- function (before, after, caps) {
  alphabet <- if (caps) LETTERS else letters
  function (x) {
    if (max(x, na.rm = TRUE) > length(alphabet)) {
      abort("Large elements in `x` cannot be represented by the alphabet")
    }
    out <- paste0(before, alphabet[as.integer(x)], after)
    out[is.na(x)] <- NA
    names(out) <- names(x)

    out
  }
}

itemized_roman <- function (before, after, caps) {
  function (x) {
    romans <- utils::as.roman(as.integer(x))
    if (! caps) romans <- tolower(romans)
    out <- paste0(before, romans, after)
    out[is.na(x)] <- NA
    names(out) <- names(x)

    out
  }
}

itemized_numeral <- function (before, after) {
  function (x) {
    out <- paste0(before, as.integer(x), after)
    out[is.na(x)] <- NA
    names(out) <- names(x)

    out
  }
}
