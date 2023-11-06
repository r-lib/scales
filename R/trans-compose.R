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
    cli::cli_abort("{.fun compose_trans} must include at least 1 transformer to compose")
  }

  # Resolve domains. First push the domain of the first transformation all the
  # way forward through the sequence of transformations, intersecting it with
  # all domains along the way, to get the range. Then push the range back
  # through the inverses to get the domain.
  range <- trans_list[[1]]$transform(trans_list[[1]]$domain)
  for (trans in trans_list[-1]) {
    lower <- max(min(trans$domain), min(range))
    upper <- min(max(trans$domain), max(range))
    if (isTRUE(lower <= upper)) {
      range <- trans$transform(c(lower, upper))
    } else {
      range <- c(NA_real_, NA_real_)
      break
    }
  }
  domain <- compose_rev(range, trans_list)
  if (any(is.na(domain))) {
    cli::cli_abort("Sequence of transformations yields invalid domain")
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
