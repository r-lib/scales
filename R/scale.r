#' Generic plot scaling methods
#'
#' @docType package
#' @name package-scales
#' @aliases scales package-scales
#' @import RColorBrewer stringr munsell plyr

# Basic properties of a scale:
#   * train -> learn range
#   * limits -> set range
#   * palette -> convert data (has parameters)
#   * (continuous) -> scale transformation (has parameters)
#   * needs to have special option for NA values
#  
# Scale becomes an implementation of the strategy pattern. The scale object
# encapulsates all mutable state - the scaling logic is implemented in a pure
# palette function.
#
# Discrete palette functions are parameterised by the number of levels.
# Continuous palette functions are parameterised by a value between 0 and 1.

Scale <- setRefClass("Scale", 
  fields = c("data_limits", "user_limits", "palette", "na.value"),
  methods = list(
    limits = function() if (is.null(user_limits)) data_limits else user_limits,
    initialize = function(palette = NULL) {
      initFields(user_limits = NULL, data_limits = NULL, palette = palette)
    }
  )
)

DiscreteScale <- setRefClass("DiscreteScale", contains = "Scale", 
  methods = list(
    train = function(x) data_limits <<- train_discrete(x, data_limits),
    map = function(x)   map_discrete(palette, x, limits())
  )
)

ContinuousScale <- setRefClass("ContinuousScale", contains = "Scale", 
  methods = list(
    train = function(x) data_limits <<- train_continuous(x, data_limits),
    map = function(x)   map_continuous(palette, x, limits)
))
