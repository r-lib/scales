Range <- setRefClass("Range", fields = "range", methods = list(
  initialize = function() {
    initFields(range = NULL)
  })
)

DiscreteRange <- setRefClass(
  "DiscreteRange", contains = "Range", 
  methods = list(
    train = function(x) range <<- train_discrete(x, range)
  )
)

ContinuousRange <- setRefClass(
  "Continuous", contains = "Range", 
  methods = list(
    train = function(x) range <<- train_continuous(x, range)
  )
)
