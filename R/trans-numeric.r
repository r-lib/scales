#' Arc-sin square root transformation
#'
#' This is the variance stabilising transformation for the binomial
#' distribution.
#'
#' @export
#' @examples
#' plot(asn_trans(), xlim = c(0, 1))
asn_trans <- function() {
  trans_new(
    "asn",
    function(x) 2 * asin(sqrt(x)),
    function(x) sin(x / 2)^2
  )
}

#' Arc-tangent transformation
#'
#' @export
#' @examples
#' plot(atanh_trans(), xlim = c(-1, 1))
atanh_trans <- function() {
  trans_new("atanh", "atanh", "tanh")
}

#' Box-Cox & modulus transformations
#'
#' The Box-Cox transformation is a flexible transformation, often used to
#' transform data towards normality. The modulus transformation generalises
#' Box-Cox to also work with negative values.
#'
#' The Box-Cox power transformation (type 1) requires strictly positive values and
#' takes the following form for `y > 0`:
#' \deqn{y^{(\lambda)} = \frac{y^\lambda - 1}{\lambda}}{y^(\lambda) = (y^\lambda - 1)/\lambda}
#' When `y = 0`, the natural log transform is used.
#'
#' The modulus transformation implements a generalisation of the Box-Cox
#' transformation that works for data with both positive and negative values.
#' The equation takes the following forms, when `y != 0` :
#' \deqn{y^{(\lambda)} = sign(y) * \frac{(|y| + 1)^\lambda - 1}{\lambda}}{
#' y^(\lambda) = sign(y)*((|y|+1)^\lambda - 1)/\lambda}
#' and when `y = 0`: \deqn{y^{(\lambda)} =  sign(y) * \ln(|y| + 1)}{
#' y^(\lambda) = sign(y) * ln(|y| + 1)}
#'
#' @param p Transformation exponent, \eqn{\lambda}.
#' @param offset Constant offset. 0 for Box-Cox type 1,
#'   otherwise any non-negative constant (Box-Cox type 2). `modulus_trans()`
#'   sets the default to 1.
#' @seealso [yj_trans()]
#' @references Box, G. E., & Cox, D. R. (1964). An analysis of transformations.
#' Journal of the Royal Statistical Society. Series B (Methodological), 211-252.
#' \url{https://www.jstor.org/stable/2984418}
#'
#' John, J. A., & Draper, N. R. (1980).
#' An alternative family of transformations. Applied Statistics, 190-197.
#' \url{http://www.jstor.org/stable/2986305}
#' @export
#' @examples
#' plot(boxcox_trans(-1), xlim = c(0, 10))
#' plot(boxcox_trans(0), xlim = c(0, 10))
#' plot(boxcox_trans(1), xlim = c(0, 10))
#' plot(boxcox_trans(2), xlim = c(0, 10))
#'
#' plot(modulus_trans(-1), xlim = c(-10, 10))
#' plot(modulus_trans(0), xlim = c(-10, 10))
#' plot(modulus_trans(1), xlim = c(-10, 10))
#' plot(modulus_trans(2), xlim = c(-10, 10))
boxcox_trans <- function(p, offset = 0) {
  trans <- function(x) {
    if (any((x + offset) < 0, na.rm = TRUE)) {
      stop("boxcox_trans must be given only positive values. Consider using modulus_trans instead?",
        call. = F
      )
    }
    if (abs(p) < 1e-07) {
      log(x + offset)
    } else {
      ((x + offset)^p - 1) / p
    }
  }

  inv <- function(x) {
    if (abs(p) < 1e-07) {
      exp(x) - offset
    } else {
      (x * p + 1)^(1 / p) - offset
    }
  }

  trans_new(
    paste0("pow-", format(p)), trans, inv
  )
}

#' @rdname boxcox_trans
#' @export
modulus_trans <- function(p, offset = 1) {
  if (abs(p) < 1e-07) {
    trans <- function(x) sign(x) * log(abs(x) + offset)
    inv <- function(x) sign(x) * (exp(abs(x)) - offset)
  } else {
    trans <- function(x) sign(x) * ((abs(x) + offset)^p - 1) / p
    inv <- function(x) sign(x) * ((abs(x) * p + 1)^(1 / p) - offset)
  }
  trans_new(
    paste0("mt-pow-", format(p)), trans, inv
  )
}

#' Yeo-Johnson transformation
#'
#' The Yeo-Johnson transformation is a flexible transformation that is similiar
#' to Box-Cox, [boxcox_trans()], but does not require input values to be greater
#' than zero.
#'
#' The transformation takes one of four forms depending on the values of `y` and \eqn{\lambda}.
#'
#' * \eqn{y \ge 0} and \eqn{\lambda \neq 0}{\lambda != 0} :
#'   \eqn{y^{(\lambda)} = \frac{(y + 1)^\lambda - 1}{\lambda}}{y^(\lambda) = ((y + 1)^\lambda - 1)/\lambda}
#' * \eqn{y \ge 0} and \eqn{\lambda = 0}:
#'   \eqn{y^{(\lambda)} = \ln(y + 1)}{y^(\lambda) = ln(y + 1)}
#' * \eqn{y < 0} and \eqn{\lambda \neq 2}{\lambda != 2}:
#'   \eqn{y^{(\lambda)} = -\frac{(-y + 1)^{(2 - \lambda)} - 1}{2 - \lambda}}{y^(\lambda) = -((-y + 1)^(2 - \lambda) - 1)/(2 - \lambda)}
#' * \eqn{y < 0} and \eqn{\lambda = 2}:
#'   \eqn{y^{(\lambda)} = -\ln(-y + 1)}{y^(\lambda) = -ln(-y + 1)}
#'
#' @param p Transformation exponent, \eqn{\lambda}.
#' @references Yeo, I., & Johnson, R. (2000).
#' A New Family of Power Transformations to Improve Normality or Symmetry. Biometrika, 87(4), 954-959.
#' \url{http://www.jstor.org/stable/2673623}
#' @export
#' @examples
#' plot(yj_trans(-1), xlim = c(-10, 10))
#' plot(yj_trans(0), xlim = c(-10, 10))
#' plot(yj_trans(1), xlim = c(-10, 10))
#' plot(yj_trans(2), xlim = c(-10, 10))
yj_trans <- function(p) {
  eps <- 1e-7

  if (abs(p) < eps) {
    trans_pos <- function(x) log(x + 1)
    inv_pos <- function(x) exp(x) - 1
  } else {
    trans_pos <- function(x) ((x + 1)^p - 1) / p
    inv_pos <- function(x) (p*x + 1)^(1/p) - 1
  }

  if (abs(2 - p) < eps) {
    trans_neg <- function(x) -log(-x + 1)
    inv_neg <- function(x) 1 - exp(-x)
  } else {
    trans_neg <- function(x) -((-x + 1)^(2 - p) - 1)/(2 - p)
    inv_neg <- function(x) 1 - (-(2 - p)*x + 1)^(1/(2 - p))
  }

  trans_new(
    paste0("yeo-johnson-", format(p)),
    function(x) trans_two_sided(x, trans_pos, trans_neg),
    function(x) trans_two_sided(x, inv_pos, inv_neg)
  )
}

trans_two_sided <- function(x, pos, neg) {
  out <- rep(NA_real_, length(x))
  present <- !is.na(x)
  out[present & x > 0] <- pos(x[present & x > 0])
  out[present & x < 0] <- neg(x[present & x < 0])
  out[present & x == 0] <- 0
  out
}

#' Exponential transformation (inverse of log transformation)
#'
#' @param base Base of logarithm
#' @export
#' @examples
#' plot(exp_trans(0.5), xlim = c(-2, 2))
#' plot(exp_trans(1), xlim = c(-2, 2))
#' plot(exp_trans(2), xlim = c(-2, 2))
#' plot(exp_trans(), xlim = c(-2, 2))
exp_trans <- function(base = exp(1)) {
  force(base)
  trans_new(
    paste0("power-", format(base)),
    function(x) base^x,
    function(x) log(x, base = base)
  )
}

#' Identity transformation (do nothing)
#'
#' @export
#' @examples
#' plot(identity_trans(), xlim = c(-1, 1))
identity_trans <- function() {
  trans_new("identity", "force", "force")
}


#' Log transformations
#'
#' * `log_trans()`: `log(x)`
#' * `log1p()`: `log(x + 1)`
#' * `pseudo_log_trans()`:  smoothly transition to linear scale around 0.
#'
#' @param base base of logarithm
#' @export
#' @examples
#' plot(log2_trans(), xlim = c(0, 5))
#' plot(log_trans(), xlim = c(0, 5))
#' plot(log10_trans(), xlim = c(0, 5))
#'
#' plot(log_trans(), xlim = c(0, 2))
#' plot(log1p_trans(), xlim = c(-1, 1))
#'
#' # The pseudo-log is defined for all real numbers
#' plot(pseudo_log_trans(), xlim = c(-5, 5))
#' lines(log_trans(), xlim = c(0, 5), col = "red")
#'
#' # For large positives nubmers it's very close to log
#' plot(pseudo_log_trans(), xlim = c(1, 20))
#' lines(log_trans(), xlim = c(1, 20), col = "red")
log_trans <- function(base = exp(1)) {
  force(base)
  trans <- function(x) log(x, base)
  inv <- function(x) base^x

  trans_new(paste0("log-", format(base)), trans, inv,
    log_breaks(base = base),
    domain = c(1e-100, Inf)
  )
}
#' @export
#' @rdname log_trans
log10_trans <- function() {
  log_trans(10)
}

#' @export
#' @rdname log_trans
log2_trans <- function() {
  log_trans(2)
}

#' @rdname log_trans
#' @export
log1p_trans <- function() {
  trans_new("log1p", "log1p", "expm1")
}

#' @rdname log_trans
#' @param sigma Scaling factor for the linear part of pseudo-log transformation.
#' @export
pseudo_log_trans <- function(sigma = 1, base = exp(1)) {
  trans_new(
    "pseudo_log",
    function(x) asinh(x / (2 * sigma)) / log(base),
    function(x) 2 * sigma * sinh(x * log(base))
  )
}

#' Probability transformation
#'
#' @param distribution probability distribution.  Should be standard R
#'   abbreviation so that "p" + distribution is a valid probability density
#'   function, and "q" + distribution is a valid quantile function.
#' @param ... other arguments passed on to distribution and quantile functions
#' @export
#' @examples
#' plot(logit_trans(), xlim = c(0, 1))
#' plot(probit_trans(), xlim = c(0, 1))
probability_trans <- function(distribution, ...) {
  qfun <- match.fun(paste0("q", distribution))
  pfun <- match.fun(paste0("p", distribution))

  trans_new(
    paste0("prob-", distribution),
    function(x) qfun(x, ...),
    function(x) pfun(x, ...)
  )
}
#' @export
#' @rdname probability_trans
logit_trans <- function() probability_trans("logis")
#' @export
#' @rdname probability_trans
probit_trans <- function() probability_trans("norm")

#' Reciprocal transformation
#'
#' @export
#' @examples
#' plot(reciprocal_trans(), xlim = c(0, 1))
reciprocal_trans <- function() {
  trans_new(
    "reciprocal",
    function(x) 1 / x,
    function(x) 1 / x
  )
}

#' Reverse transformation
#'
#' @export
#' @examples
#' plot(reverse_trans(), xlim = c(-1, 1))
reverse_trans <- function() {
  trans_new(
    "reverse",
    function(x) -x,
    function(x) -x,
    minor_breaks = regular_minor_breaks(reverse = TRUE)
  )
}

#' Square-root transformation
#'
#' This is the variance stabilising transformation for the Poisson
#' distribution.
#'
#' @export
#' @examples
#' plot(sqrt_trans(), xlim = c(0, 5))
sqrt_trans <- function() {
  trans_new(
    "sqrt",
    "sqrt",
    function(x) x ^ 2,
    domain = c(0, Inf)
  )
}

