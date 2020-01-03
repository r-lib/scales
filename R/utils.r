# Evaluates all arguments (see #81)
force_all <- function(...) list(...)

range_finite <- function(x) {
  suppressWarnings(range(x, na.rm = TRUE, finite = TRUE))
}

seq2 <- function(from, to) {
  if (from > to) {
    numeric()
  } else {
    from:to
  }
}

demo_ggplot <- function(x, scale_name, ...) {
  call <- substitute(list(...))
  call[[1]] <- as.name(scale_name)
  cat(paste0(deparse(call), "\n", collapse = ""))

  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    message("Skipping; ggplot2 not installed")
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
