#' Mutable ranges.
#'
#' Mutable ranges have a two methods (\code{train} and \code{reset}), and
#' make it possible to build up complete ranges with multiple passes.
#'
#' @aliases DiscreteRange ContinuousRange
#' @export DiscreteRange ContinuousRange
Range <- R6::R6Class("Range", list(
  range = NULL,
  initialize = function() {
    self$range <- NULL
  })
)

DiscreteRange <- R6::R6Class(
  "DiscreteRange",
  inherit = "Range",
  list(
    train = function(x, drop = FALSE) {
      self$range <- train_discrete(x, range, drop)
    },
    reset = function() self$range <- NULL
  )
)

ContinuousRange <- R6::R6Class(
  "ContinuousRange",
  inherit = "Range",
  list(
    train = function(x) self$range <- train_continuous(x, range),
    reset = function() self$range <- NULL
  )
)
