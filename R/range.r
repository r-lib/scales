#' Mutable ranges.
#'
#' Mutable ranges have a single method (\code{train}), and make it possible
#' to build up complete ranges with multiple passes.
#'
#' @aliases DiscreteRange ContinuousRange
#' @export DiscreteRange ContinuousRange
Range <- setRefClass("Range", fields = "range", methods = list(
  initialize = function() {
    initFields(range = NULL)
  })
)

DiscreteRange <- setRefClass(
  "DiscreteRange", contains = "Range", 
  methods = list(
    train = function(x, drop) range <<- train_discrete(x, range, drop)
  )
)

ContinuousRange <- setRefClass(
  "Continuous", contains = "Range", 
  methods = list(
    train = function(x) range <<- train_continuous(x, range)
  )
)
