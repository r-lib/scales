#' Generic plot scaling methods
#'
#' @docType package
#' @name package-scales
#' @aliases scales package-scales
#' @import RColorBrewer stringr munsell plyr
NULL 

# Basic properties of a scale:
#   * learn range (train)
#   * set range (user_limmits)
#   * convert data to aesthetics (map)
#   * (special value for NA values)
# 
# Additional properties of a continuous scale
#   * transformation + rescaling 
#  
# Scale becomes an implementation of the strategy pattern. The scale object
# just provides a thin layer of mutable state which allows the ranges to be
# updated multiple times.
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
