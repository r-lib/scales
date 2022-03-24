#' Compose two or more transformations together
#'
#' This transformer provides a general mechanism for composing two or more
#' transformers together. The most important use case is to combine reverse
#' with other transformations.
#'
#' @param ... One or more transformers, either specified with string or
#'   as individual transformer objects.
#' @export
#' @examples
#' demo_continuous(10^c(-2:4), trans = "log10", labels = label_log())
#' demo_continuous(10^c(-2:4), trans = c("log10", "reverse"), labels = label_log())
compose_trans <- function(...) {
  trans_list <- lapply(list2(...), as.trans)
  if (length(trans_list) == 0) {
    abort("Must include at least 1 transformer to compose")
  }

  # Resolve domains
  suppressWarnings(
    domain <- compose_fwd(trans_list[[1]]$domain, trans_list[-1])
  )
  if (any(is.na(domain))) {
    abort("Sequence of transformations yields invalid domain")
  }
  domain <- range(domain)

  names <- vapply(trans_list, "[[", "name", FUN.VALUE = character(1))

  trans_new(
    paste0("composition(", paste0(names, collapse = ","), ")"),
    transform = function(x) compose_fwd(x, trans_list),
    inverse   = function(x) compose_rev(x, trans_list),
    breaks    = function(x) trans_list[[1]]$breaks(x),
    domain = domain
  )
}

compose_fwd <- function(x, trans_list) {
  for (trans in trans_list) {
    x <- trans$transform(x)
  }
  x
}

compose_rev <- function(x, trans_list) {
  for (trans in rev(trans_list)) {
    x <- trans$inverse(x)
  }
  x
}
