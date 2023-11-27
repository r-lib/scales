#' Mutable ranges
#'
#' Mutable ranges have a two methods (`train` and `reset`), and
#' make it possible to build up complete ranges with multiple passes.
#'
#' @export
Range <- R6::R6Class("Range", list(
  range = NULL,
  initialize = function() {
    self$range <- NULL
  }
))

#' @export
#' @rdname Range
DiscreteRange <- R6::R6Class(
  "DiscreteRange",
  inherit = Range,
  list(
    factor = NULL,
    train = function(x, drop = FALSE, na.rm = FALSE) {
      self$factor <- self$factor %||% is.factor(x)
      self$range <- train_discrete(x, self$range, drop, na.rm, self$factor)
    },
    reset = function() {
      self$range <- NULL
      self$factor <- NULL
    }
  )
)

#' @export
#' @rdname Range
ContinuousRange <- R6::R6Class(
  "ContinuousRange",
  inherit = Range,
  list(
    train = function(x) self$range <- train_continuous(x, self$range),
    reset = function() self$range <- NULL
  )
)
