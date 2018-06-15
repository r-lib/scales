#' Arc-sin square root transformation.
#'
#' @export
asn_trans <- function() {
  trans_new(
    "asn",
    function(x) 2 * asin(sqrt(x)),
    function(x) sin(x / 2)^2
  )
}

#' Arc-tangent transformation.
#'
#' @export
atanh_trans <- function() {
  trans_new("atanh", "atanh", "tanh")
}

#' Box-Cox power transformation.
#'
#' @param p Exponent of boxcox transformation.
#' @references See <http://en.wikipedia.org/wiki/Power_transform> for
#   more details on method.
#' @export
boxcox_trans <- function(p) {
  if (abs(p) < 1e-07) return(log_trans())

  trans <- function(x) (x^p - 1) / p * sign(x - 1)
  inv <- function(x) (abs(x) * p + 1 * sign(x))^(1 / p)
  trans_new(
    paste0("pow-", format(p)), trans, inv
  )
}

#' Exponential transformation (inverse of log transformation).
#'
#' @param base Base of logarithm
#' @export
exp_trans <- function(base = exp(1)) {
  force(base)
  trans_new(
    paste0("power-", format(base)),
    function(x) base^x,
    function(x) log(x, base = base)
  )
}

#' Identity transformation (do nothing).
#'
#' @export
identity_trans <- function() {
  trans_new("identity", "force", "force")
}


#' Log transformation.
#'
#' @param base base of logarithm
#' @aliases log_trans log10_trans log2_trans
#' @export log_trans log10_trans log2_trans
log_trans <- function(base = exp(1)) {
  force(base)
  trans <- function(x) log(x, base)
  inv <- function(x) base^x

  trans_new(paste0("log-", format(base)), trans, inv,
    log_breaks(base = base),
    domain = c(1e-100, Inf)
  )
}
log10_trans <- function() {
  log_trans(10)
}
log2_trans <- function() {
  log_trans(2)
}

#' Log plus one transformation.
#'
#' @export
#' @examples
#' trans_range(log_trans(), 1:10)
#' trans_range(log1p_trans(), 0:9)
log1p_trans <- function() {
  trans_new("log1p", "log1p", "expm1")
}

#' Probability transformation.
#'
#' @param distribution probability distribution.  Should be standard R
#'   abbreviation so that "p" + distribution is a valid probability density
#'   function, and "q" + distribution is a valid quantile function.
#' @param ... other arguments passed on to distribution and quantile functions
#' @aliases probability_trans logit_trans probit_trans
#' @export probability_trans logit_trans probit_trans
probability_trans <- function(distribution, ...) {
  qfun <- match.fun(paste0("q", distribution))
  pfun <- match.fun(paste0("p", distribution))

  trans_new(
    paste0("prob-", distribution),
    function(x) qfun(x, ...),
    function(x) pfun(x, ...)
  )
}
logit_trans <- function() probability_trans("logis")
probit_trans <- function() probability_trans("norm")

#' Reciprocal transformation.
#'
#' @export
reciprocal_trans <- function() {
  trans_new(
    "reciprocal",
    function(x) 1 / x,
    function(x) 1 / x
  )
}

#' Reverse transformation.
#'
#' @export
reverse_trans <- function() {
  trans_new(
    "reverse",
    function(x) -x,
    function(x) -x,
    minor_breaks = regular_minor_breaks(reverse = TRUE)
  )
}

#' Square-root transformation.
#'
#' @export
sqrt_trans <- function() {
  trans_new("sqrt", "sqrt", function(x) x^2, domain = c(0, Inf))
}

#' Pseudo-log transformation
#'
#' A transformation mapping numbers to a signed logarithmic scale
#' with a smooth transition to linear scale around 0.
#'
#' @param sigma scaling factor for the linear part
#' @param base approximate logarithm base used
#' @export
pseudo_log_trans <- function(sigma = 1, base = exp(1)) {
  trans_new(
    "pseudo_log",
    function(x) asinh(x / (2 * sigma)) / log(base),
    function(x) 2 * sigma * sinh(x * log(base))
  )
}
