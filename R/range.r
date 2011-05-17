#' Mutable ranges.
#'
#' Mutable ranges have a two methods (\code{train} and \code{reset}), and
#' make it possible to build up complete ranges with multiple passes.
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
    train = function(x, drop) range <<- train_discrete(x, range, drop),
    reset = function() range <<- NULL
  )
)

ContinuousRange <- setRefClass(
  "Continuous", contains = "Range", 
  methods = list(
    train = function(x) range <<- train_continuous(x, range),
    reset = function() range <<- NULL
  )
)
