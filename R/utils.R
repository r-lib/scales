# Evaluates all arguments (see #81)
force_all <- function(...) list(...)

demo_ggplot <- function(x, scale_name, ...) {
  call <- substitute(list(...))
  call[[1]] <- as.name(scale_name)
  cat(paste0(deparse(call), "\n", collapse = ""))

  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    cli::cli_inform("Skipping; {.pkg ggplot2} not installed")
    return(invisible())
  }

  scale <- getExportedValue("ggplot2", scale_name)
  df <- data.frame(x = x, stringsAsFactors = FALSE)
  ggplot2::ggplot(df, ggplot2::aes(x, 1)) +
    ggplot2::geom_blank() +
    scale(NULL, ...) +
    ggplot2::scale_y_continuous(NULL, breaks = NULL) +
    ggplot2::theme(aspect.ratio = 1 / 5)
}

#' Demonstrate scales functions with ggplot2 code
#'
#' These functions generate ggplot2 code needed to use scales functions for
#' real code.
#'
#' @param x A vector of data
#' @keywords internal
#' @export
demo_continuous <- function(x, ...) {
  demo_ggplot(x, "scale_x_continuous", ...)
}

#' @rdname demo_continuous
#' @export
demo_log10 <- function(x, ...) {
  demo_ggplot(x, "scale_x_log10", ...)
}

#' @rdname demo_continuous
#' @export
demo_discrete <- function(x, ...) {
  demo_ggplot(x, "scale_x_discrete", ...)
}

#' @rdname demo_continuous
#' @export
demo_datetime <- function(x, ...) {
  demo_ggplot(x, "scale_x_datetime", ...)
}

#' @rdname demo_continuous
#' @export
demo_time <- function(x, ...) {
  demo_ggplot(x, "scale_x_time", ...)
}

#' @rdname demo_continuous
#' @export
demo_timespan <- function(x, ...) {
  demo_ggplot(x, "scale_x_continuous", ...)
}

# Based on rlang/R/standalone-vctrs.R shim
recycle_common <- function(..., size = NULL, call = caller_env()) {
  x <- list2(...)
  sizes <- lengths(x)
  n <- unique(sizes)
  if (length(n) == 1 && is.null(size)) {
    return(x)
  }
  n <- setdiff(n, 1L)
  ns <- length(n)

  if (ns == 1) {
    if (is.null(size)) {
      size <- n
    } else if (n != size) {
      bad <- names(sizes)[sizes != size]
      cli::cli_abort(
        "Cannot recycle {.and {.arg {bad}}} to length {size}.",
        call = call
      )
    }
  } else {
    bad <- names(sizes)[!(sizes %in% c(1, size))]
    what <- if (is.null(size)) "a common size" else paste0("length ", size)
    cli::cli_abort(
      "Cannot recycle {.and {.arg {bad}}} to {what}.",
      call = call
    )
  }

  to_recycle <- sizes == 1L
  x[to_recycle] <- lapply(x[to_recycle], rep_len, length.out = size)
  x
}

as_cli <- function(..., env = caller_env()) {
  cli::cli_fmt(cli::cli_text(..., .envir = env))
}

check_object <- function(
  x,
  check_fun,
  what,
  ...,
  allow_null = FALSE,
  arg = caller_arg(x),
  call = caller_env()
) {
  if (!missing(x)) {
    if (check_fun(x)) {
      return(invisible(NULL))
    }
    if (allow_null && is_null(x)) {
      return(invisible(NULL))
    }
  }

  stop_input_type(
    x,
    as_cli(what),
    ...,
    allow_null = allow_null,
    arg = arg,
    call = call
  )
}

.onLoad <- function(lib, pkg) {
  run_on_load()
}
