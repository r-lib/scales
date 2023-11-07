#' Label numbers with SI prefixes (2 kg, 5 mm, etc)
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `label_number_si()` is deprecated because the previous unit didn't actually
#' use SI units, but instead used the so called "short scale". You can now get the
#' same results as before with
#' `label_number(scale_cut = cut_short_scale())`, or if you want correct SI
#' units, `label_number(scale_cut = cut_si("unit"))`.
#'
#' @keywords internal
#' @inherit label_number return params
#' @param unit Unit of measurement (e.g. `"m"` for meter, the SI unit of length).
#' @param scale A scaling factor: `x` will be multiplied by `scale` before
#'   formatting. This is useful if the underlying data is already using an SI
#'   prefix.
#' @inheritDotParams label_number
#' @export
#' @family labels for continuous scales
#' @family labels for log scales
label_number_si <- function(unit = "", accuracy = NULL, scale = 1, suffix = "", ...) {
  lifecycle::deprecate_stop(
    when = "1.2.0",
    what = "label_number_si()",
    with = "label_number(scale_cut)"
  )
}

cut_bad_si <- function(unit) {
  out <- cut_short_scale(unit != "")
  names(out) <- paste0(names(out), unit)
  out
}
