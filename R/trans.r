# # Create regular sequence in original scale, then transform back
# seq <- function(., from, to, length) {
#   .$transform(get("seq", pos=1)(.$inverse(from), .$inverse(to), length=length))
# }
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

#' Create a new transformation object.
#'
#' A transformation encapsulates a transformation and its inverse, as well
#' as the information needed to create pleasing breaks and labels. The breaks
#' function is applied on the transformed range of the range, and it's
#' expected that the labels function will perform some kind of inverse
#' tranformation on these breaks to give them labels that are meaningful on 
#' the original scale.
#'
#' @param name transformation name
#' @param transform function, or name of function, that performs the
#    transformation
#' @param inverse function, or name of function, that performs the
#    inverse of the transformation
#' @param breaks default breaks function for this transformation. The breaks
#'   function is applied on the transformed scale.
#' @param format default format for this transformation. The format is applied
#'   to breaks generated on the transformed scale.
#' @seealso \Sexpr[results=rd]{scales:::seealso_trans()}
#' @export trans_new is.trans
#' @aliases trans_new trans
#' @S3method print trans
trans_new <- function(name, transform, inverse, breaks = pretty_breaks(transform), format = trans_format(inverse)) {
  if (is.character(transform)) transform <- match.fun(transform)
  if (is.character(inverse)) inverse <- match.fun(inverse)
  
  structure(list(name = name, transform = transform, inverse = inverse,
    breaks = breaks, labels = labels), 
    class = "trans")
}

is.trans <- function(x) inherits(x, "trans")
print.trans <- function(x, ...) cat("Transformer: ", x$name)

#' Arc-sin square root transformation.
#'
#' @export
asn_trans <- function() {
  trans_new(
    "asn", 
    function(x) 2 * asin(sqrt(x)), 
    function(x) sin(x / 2) ^ 2)
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
#' @references See \url{http://en.wikipedia.org/wiki/Power_transform} for 
#   more details on method.
#' @export
boxcox_trans <- function(p) {
  if (abs(p) < 1e-07) return(log_trans)
  trans <- function(x) (x ^ p - 1) / p * sign(x - 1)
  inv <- function(x) (abs(x) * p + 1 * sign(x)) ^ (1 / p)
  
  trans_new(
    str_c("pow-", format(p)), trans, inv,
    trans_breaks(inv), scientific_format())
}

#' Exponential transformation (inverse of log transformation).
#'
#' @param base Base of logarithm
#' @export
exp_trans <- function(base = exp(1)) {
  trans_new(
    str_c("power-", format(base)), 
    function(x) base ^ x,
    function(x) log(x, base = base))
}

#' Identity transformation (do nothing).
#'
#' @export
identity_trans <- function() {
  trans_new("identity", "force", "force",
    pretty_breaks(), scientific_format())
}


#' Log transformation.
#' 
#' @param base base of logarithm
#' @aliases log_trans log10_trans log2_trans
#' @export log_trans log10_trans log2_trans
log_trans <- function(base = exp(1)) {
  trans <- function(x) log(x, base)
  inv <- function(x) base ^ x
  
  trans_new(str_c("log-", format(base)), trans, inv, 
    integer_breaks(), trans_format(inv, scientific_format()))
}
log10_trans <- function() {
  log_trans(10)
}
log2_trans <- function() {
  log_trans(2)
}

#' Log plus one transformation
#'
#' @export
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
  qfun <- match.fun(str_c("q", distribution))
  pfun <- match.fun(str_c("p", distribution))
  
  trans_new(
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
  trans_new("reciprocal", 
    function(x) 1 / x, 
    function(x) 1 / x)
}

#' Reverse transformation.
#'
#' @export
reverse_trans <- function() {
  trans_new("reverse", function(x) -x, function(x) -x)
}

#' Square-root transformation (special case of Box-Cox).
#'
#' @export
sqrt_trans <- function() {
  boxcox_trans(2)
}
