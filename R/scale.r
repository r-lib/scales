# Basic properties of a scale:
#   * train -> learn range
#   * limits -> set range
#   * palette -> convert data (has parameters)
#   * (continuous) -> scale transformation (has parameters)
#  
# Scale becomes an implementation of the strategy pattern.  The scale object
# encapulsates all mutable state - the scaling logic is implemented in a pure
# function.

Scale

DiscreteScale 
  train <- function(x) 
  map <- function(x) scale(x, )
  limits
  palette

ContinuousScale
  palette
  transform

scale_discrete <- function(x, limits, values) {
  values[match(x, limits)]
}
