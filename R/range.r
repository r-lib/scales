#' Mutable ranges.
#'
#' Mutable ranges have a two methods (\code{train} and \code{reset}), and
#' make it possible to build up complete ranges with multiple passes.
#'
#' @aliases DiscreteRange ContinuousRange
#' @export DiscreteRange ContinuousRange
Range <- methods::setRefClass("Range", fields = "range", methods = list(
  initialize = function() {
    initFields(range = NULL)
  })
)

DiscreteRange <- methods::setRefClass(
  "DiscreteRange", contains = "Range",
  methods = list(
    train = function(x, drop = FALSE) {
      range <<- train_discrete(x, range, drop)
    },
    reset = function() range <<- NULL
  )
)

ContinuousRange <- methods::setRefClass(
  "Continuous", contains = "Range",
  methods = list(
    train = function(x) range <<- train_continuous(x, range),
    reset = function() range <<- NULL
  )
)
