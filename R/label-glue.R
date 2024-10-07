
label_glue <- function(pattern = "{x}", ..., .envir = caller_env()) {
  args <- list2(...)
  force_all(pattern, .envir)
  function(x) {
    inject(glue::glue_data(list(x = x), pattern, !!!args, .envir = .envir))
  }
}
