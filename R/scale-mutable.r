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
# updated multiple times, and provides a convenient way of bundling all scale
# related parameters together.
#
# Discrete palette functions are parameterised by the number of levels.
# Continuous palette functions are parameterised by a value between 0 and 1.

Scale <- setRefClass("Scale", 
  fields = c(
    "data_limits", 
    "palette", 
    "na.value", 
    "user_limits", 
    "user_breaks",
    "user_labels"
  ),
  methods = list(
    limits = function() {
      if (is.null(user_limits)) data_limits else user_limits
    },
    breaks = function() {
      if (is.null(user_breaks)) return(data_breaks())
      if (is.function(user_breaks)) {
        user_breaks(limits())
      } else {
        user_breaks
      }
    },
    data_breaks = function() stop("Override in children"),
    labels = function() {
      if (is.null(user_labels)) return(data_labels())
      if (is.function(user_labels)) {
        user_labels(limits())
      } else {
        user_labels
      }
    },
    initialize = function(palette = NULL) {
      initFields(user_limits = NULL, data_limits = NULL, palette = palette)
    }
  )
)

DiscreteScale <- setRefClass("DiscreteScale", contains = "Scale", 
  methods = list(
    train = function(x) {
      data_limits <<- train_discrete(x, data_limits)
    }, 
    map = function(x)   {
      map_discrete(palette, x, limits(), na.value)
    },
    data_breaks = function() {
      seq_len(limits())
    },
    data_labels = function() {
      limits()
    }
  )
)

ContinuousScale <- setRefClass("ContinuousScale", contains = "Scale", 
  fields = c("trans"),
  methods = list(
    initialize = function(palette = NULL, trans = identity_trans()) {
      initFields(user_limits = NULL, data_limits = NULL, user_breaks = NULL, 
        user_labels = NULL, palette = palette, trans = trans)
    },
    transform = {
      "If you're using the scale yourself, you must transform the data prior
       training.  In ggplot2, scale transformation happens very early on so
       that statistical transformation isn't done on the raw data."
      function(x) trans$trans(x)
    },
    train = function(x) {
      data_limits <<- train_continuous(x, data_limits)
    },
    map = function(x)   {
      map_continuous(palette, x, limits, na.value)
    },
    data_breaks = function() {
      trans$breaks(limits())
    },
    data_labels = function() {
      trans$labels(breaks())
    }
  )
)
