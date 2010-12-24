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
