# # Create regular sequence in original scale, then transform back
# seq <- function(., from, to, length) {
#   .$transform(get("seq", pos=1)(.$inverse(from), .$inverse(to), length=length))
# }
# 
# input_breaks <- function(., range) {
#   grid.pretty(range)
# }
# 
# # Minor breaks are regular on the original scale
# # and need to cover entire range of plot
# output_breaks <- function(., n = 2, b, r) {
#   if (length(b) == 1) return(b)
# 
#   bd <- diff(b)[1]
#   if (min(r) < min(b)) b <- c(b[1] - bd, b)
#   if (max(r) > max(b)) b <- c(b, b[length(b)] + bd)
#   unique(unlist(mapply(.$seq, b[-length(b)], b[-1], length=n+1, SIMPLIFY=F)))
# }
#   
# check <- function(., values) {
#   .$inverse(.$transform(values))
# }

#' Create a new transformation function
#'
#' @param name transformation name
#' @param transform function, or name of function, that performs the
#    transformation
#' @param inverse function, or name of function, that performs the
#    inverse of the transformation
#' @export
new_trans <- function(name, transform, inverse, labels = inverse) {
  if (is.character(transform)) transform <- match.fun(transform)
  if (is.character(inverse)) inverse <- match.fun(inverse)
  if (is.character(labels)) labels <- match.fun(labels)
  
  structure(list(name = name, transform = transform, inverse = inverse, 
    labels = labels), class = "trans")
}

is.trans <- function(x) inherits(x, "trans")
print.trans <- function(x, ...) cat("Transformer: ", x$name)

#' Arc-sin square root transformation.
#'
#' @export
asn_trans <- function() {
  new_trans(
    "asn", 
    function(x) 2 * asin(sqrt(x)), 
    function(x) sin(x / 2) ^ 2)
}

#' Arc-tangent transformation.
#'
#' @export
atanh_trans <- function() {
  new_trans("atanh", "atanh", "tanh")
}

#' Box-Cox power transformation.
#'
#' @param p Exponent of boxcox transformation.
#' @references See \url{http://en.wikipedia.org/wiki/Power_transform} for 
#   more details on method.
#' @export
boxcox_trans <- function(p) {
  if (abs(p) < 1e-07) return(log_trans)
  
  new_trans(
    str_c("pow-", format(p)),
    function(x) (x ^ p - 1) / p * sign(x - 1),
    function(x) (abs(x) * p + 1 * sign(x)) ^ (1 / p))
}

#' Exponential transformation (inverse of log transformation).
#'
#' @param base Base of logarithm
#' @export
exp_trans <- function(base = exp(1)) {
  new_trans(
    str_c("power-", format(base)), 
    function(x) base ^ x,
    function(x) log(x, base = base))
}

#' Identity transformation (do nothing).
#'
#' @export
identity_trans <- function() {
  new_trans("identity", "force", "force")
}


#' Log transformation.
#' 
#' @param base base of logarithm
#' @aliases log_trans log10_trans log2_trans
#' @export
log_trans <- function(base = exp(1)) {
  new_trans(str_c("log-", format(base)),
    function(x) log(x, base),
    function(x) base ^ x)
}
log10_trans <- function() {
  log_trans(10)
}
log2_trans <- function() {
  log_trans(2)
}

log1p_trans <- function() {
  new_trans("log1p", "log1p", "expm1")
}

#' Probability transformation.
#' 
#' @param distribution probability distribution.  Should be standard R
#'   abbreviation so that "p" + distribution is a valid probability density
#'   function, and "q" + distribution is a valid quantile function.
#' @param ... other arguments passed on to distribution and quantile functions
#' @aliases probability_trans logit_trans, probit_trans
#' @export
probability_trans <- function(distribution, ...) {
  qfun <- match.fun(str_c("q", distribution))
  pfun <- match.fun(str_c("p", distribution))
  
  new_trans(
    str_c("prob-", distribution), 
    function(x) qfun(x, ...), 
    function(x) pfun(x, ...))
}
logit_trans <- function() probability_trans("logis")
probit_trans <- function() probability_trans("norm")

#' Reciprocal transformation.
#'
#' @export
reciprocal_trans <- function() {
  new_trans("reciprocal", 
    function(x) 1 / x, 
    function(x) 1 / x)
}

#' Reverse transformation.
#'
#' @export
reverse_trans <- function() {
  new_trans("reverse", function(x) -x, function(x) -x)
}

#' Square-root transformation (special case of Box-Cox).
#'
#' @export
sqrt_trans <- function() {
  boxcox_trans(2)
}
