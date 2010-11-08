#' Generic plot scaling methods
#'
#' @docType package
#' @aliases scales package-scales
#' @import RColorBrewer stringr


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
    train = function(x) {
      if (!is.discrete(x)) {
        stop("Continuous value supplied to discrete scale", call. = FALSE) 
      }
      data_limits <<- discrete_range(data_limits, x)
    },
    map = function(x) {
      n <- length(limits())
      palette(n)[match(as.character(x), limits())]      
    }
  )
)
discrete_scale <- function(x, palette) {
  scale <- DiscreteScale$new(palette)
  scale$train(x)
  scale$map(x)
}

ContinuousScale <- setRefClass("ContinuousScale", contains = "Scale", 
  methods = list(
    train = function(x) {
      if (!is.numeric(x)) {
        stop("Discrete value supplied to continuous scale",  call. = FALSE)
      }
      data_limits <<- range(data_limits, x, na.rm = TRUE, finite = TRUE)
    }, 
    map = function(x) {
      x <- rescale(x, from = limits())
      palette(x)
    }
))
continuous_scale <- function(x, palette) {
  scale <- ContinousScale$new(palette)
  scale$train(x)
  scale$map(x)
}
