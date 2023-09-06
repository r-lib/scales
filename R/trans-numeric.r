#' Arc-sin square root transformation
#'
#' This is the variance stabilising transformation for the binomial
#' distribution.
#'
#' @export
#' @examples
#' plot(trans_asn(), xlim = c(0, 1))
trans_asn <- function() {
  trans_new(
    "asn",
    function(x) 2 * asin(sqrt(x)),
    function(x) sin(x / 2)^2
  )
}

#' @export
#' @rdname trans_asn
asn_trans <- trans_asn

#' Arc-tangent transformation
#'
#' @export
#' @examples
#' plot(trans_atanh(), xlim = c(-1, 1))
trans_atanh <- function() {
  trans_new("atanh", "atanh", "tanh")
}

#' @export
#' @rdname trans_atanh
atanh_trans <- trans_atanh

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
#'   otherwise any non-negative constant (Box-Cox type 2). `trans_modulus()`
#'   sets the default to 1.
#' @seealso [trans_yj()]
#' @references Box, G. E., & Cox, D. R. (1964). An analysis of transformations.
#' Journal of the Royal Statistical Society. Series B (Methodological), 211-252.
#' \url{https://www.jstor.org/stable/2984418}
#'
#' John, J. A., & Draper, N. R. (1980).
#' An alternative family of transformations. Applied Statistics, 190-197.
#' \url{http://www.jstor.org/stable/2986305}
#' @export
#' @examples
#' plot(trans_boxcox(-1), xlim = c(0, 10))
#' plot(trans_boxcox(0), xlim = c(0, 10))
#' plot(trans_boxcox(1), xlim = c(0, 10))
#' plot(trans_boxcox(2), xlim = c(0, 10))
#'
#' plot(trans_modulus(-1), xlim = c(-10, 10))
#' plot(trans_modulus(0), xlim = c(-10, 10))
#' plot(trans_modulus(1), xlim = c(-10, 10))
#' plot(trans_modulus(2), xlim = c(-10, 10))
trans_boxcox <- function(p, offset = 0) {
  trans <- function(x) {
    if (any((x + offset) < 0, na.rm = TRUE)) {
      stop("trans_boxcox must be given only positive values. Consider using trans_modulus instead?",
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

#' @export
#' @rdname trans_boxcox
boxcox_trans <- trans_boxcox

#' @rdname trans_boxcox
#' @export
trans_modulus <- function(p, offset = 1) {
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

#' @export
#' @rdname trans_boxcox
modulus_trans <- trans_modulus

#' Yeo-Johnson transformation
#'
#' The Yeo-Johnson transformation is a flexible transformation that is similiar
#' to Box-Cox, [trans_boxcox()], but does not require input values to be greater
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
#' plot(trans_yj(-1), xlim = c(-10, 10))
#' plot(trans_yj(0), xlim = c(-10, 10))
#' plot(trans_yj(1), xlim = c(-10, 10))
#' plot(trans_yj(2), xlim = c(-10, 10))
trans_yj <- function(p) {
  eps <- 1e-7

  if (abs(p) < eps) {
    trans_pos <- function(x) log(x + 1)
    inv_pos <- function(x) exp(x) - 1
  } else {
    trans_pos <- function(x) ((x + 1)^p - 1) / p
    inv_pos <- function(x) (p * x + 1)^(1 / p) - 1
  }

  if (abs(2 - p) < eps) {
    trans_neg <- function(x) -log(-x + 1)
    inv_neg <- function(x) 1 - exp(-x)
  } else {
    trans_neg <- function(x) -((-x + 1)^(2 - p) - 1) / (2 - p)
    inv_neg <- function(x) 1 - (-(2 - p) * x + 1)^(1 / (2 - p))
  }

  trans_new(
    paste0("yeo-johnson-", format(p)),
    function(x) trans_two_sided(x, trans_pos, trans_neg),
    function(x) trans_two_sided(x, inv_pos, inv_neg)
  )
}

#' @export
#' @rdname trans_yj
yj_trans <- trans_yj

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
#' plot(trans_exp(0.5), xlim = c(-2, 2))
#' plot(trans_exp(1), xlim = c(-2, 2))
#' plot(trans_exp(2), xlim = c(-2, 2))
#' plot(trans_exp(), xlim = c(-2, 2))
trans_exp <- function(base = exp(1)) {
  force(base)
  trans_new(
    paste0("power-", format(base)),
    function(x) base^x,
    function(x) log(x, base = base)
  )
}

#' @export
#' @rdname trans_exp
exp_trans <- trans_exp

#' Identity transformation (do nothing)
#'
#' @export
#' @examples
#' plot(trans_identity(), xlim = c(-1, 1))
trans_identity <- function() {
  trans_new("identity", "force", "force")
}

#' @export
#' @rdname trans_exp
identity_trans <- trans_identity

#' Log transformations
#'
#' * `trans_log()`: `log(x)`
#' * `trans_log1p()`: `log(x + 1)`
#' * `trans_pseudo_log()`:  smoothly transition to linear scale around 0.
#'
#' @param base base of logarithm
#' @export
#' @examples
#' plot(trans_log2(), xlim = c(0, 5))
#' plot(trans_log(), xlim = c(0, 5))
#' plot(trans_log10(), xlim = c(0, 5))
#'
#' plot(trans_log(), xlim = c(0, 2))
#' plot(trans_log1p(), xlim = c(-1, 1))
#'
#' # The pseudo-log is defined for all real numbers
#' plot(trans_pseudo_log(), xlim = c(-5, 5))
#' lines(trans_log(), xlim = c(0, 5), col = "red")
#'
#' # For large positives nubmers it's very close to log
#' plot(trans_pseudo_log(), xlim = c(1, 20))
#' lines(trans_log(), xlim = c(1, 20), col = "red")
trans_log <- function(base = exp(1)) {
  force(base)
  trans <- function(x) log(x, base)
  inv <- function(x) base^x

  trans_new(paste0("log-", format(base)), trans, inv,
    log_breaks(base = base),
    domain = c(1e-100, Inf)
  )
}

#' @export
#' @rdname trans_log
log_trans <- trans_log

#' @export
#' @rdname trans_log
trans_log10 <- function() {
  trans_log(10)
}

#' @export
#' @rdname trans_log
log10_trans <- trans_log10

#' @export
#' @rdname trans_log
trans_log2 <- function() {
  trans_log(2)
}

#' @export
#' @rdname trans_log
log2_trans <- trans_log2

#' @rdname trans_log
#' @export
trans_log1p <- function() {
  trans_new("log1p", "log1p", "expm1")
}

#' @export
#' @rdname trans_log
log1p_trans <- trans_log1p

#' @rdname trans_log
#' @param sigma Scaling factor for the linear part of pseudo-log transformation.
#' @export
trans_pseudo_log <- function(sigma = 1, base = exp(1)) {
  trans_new(
    "pseudo_log",
    function(x) asinh(x / (2 * sigma)) / log(base),
    function(x) 2 * sigma * sinh(x * log(base))
  )
}

#' @export
#' @rdname trans_log
pseudo_log_trans <- trans_pseudo_log

#' Probability transformation
#'
#' @param distribution probability distribution.  Should be standard R
#'   abbreviation so that "p" + distribution is a valid probability density
#'   function, and "q" + distribution is a valid quantile function.
#' @param ... other arguments passed on to distribution and quantile functions
#' @export
#' @examples
#' plot(trans_logit(), xlim = c(0, 1))
#' plot(trans_probit(), xlim = c(0, 1))
trans_probability <- function(distribution, ...) {
  qfun <- match.fun(paste0("q", distribution))
  pfun <- match.fun(paste0("p", distribution))

  trans_new(
    paste0("prob-", distribution),
    function(x) qfun(x, ...),
    function(x) pfun(x, ...)
  )
}

#' @export
#' @rdname trans_probability
probability_trans <- trans_probability

#' @export
#' @rdname trans_probability
trans_logit <- function() trans_probability("logis")
#' @export
#' @rdname trans_probability
logit_trans <- trans_logit
#' @export
#' @rdname trans_probability
trans_probit <- function() trans_probability("norm")
#' @export
#' @rdname trans_probability
probit_trans <- trans_probit

#' Reciprocal transformation
#'
#' @export
#' @examples
#' plot(trans_reciprocal(), xlim = c(0, 1))
trans_reciprocal <- function() {
  trans_new(
    "reciprocal",
    function(x) 1 / x,
    function(x) 1 / x
  )
}

#' @export
#' @rdname trans_reciprocal
reciprocal_trans <- trans_reciprocal

#' Reverse transformation
#'
#' @export
#' @examples
#' plot(trans_reverse(), xlim = c(-1, 1))
trans_reverse <- function() {
  trans_new(
    "reverse",
    function(x) -x,
    function(x) -x,
    minor_breaks = regular_minor_breaks(reverse = TRUE)
  )
}

#' @export
#' @rdname trans_reverse
reverse_trans <- trans_reverse

#' Square-root transformation
#'
#' This is the variance stabilising transformation for the Poisson
#' distribution.
#'
#' @export
#' @examples
#' plot(trans_sqrt(), xlim = c(0, 5))
trans_sqrt <- function() {
  trans_new(
    "sqrt",
    "sqrt",
    function(x) x^2,
    domain = c(0, Inf)
  )
}

#' @export
#' @rdname trans_sqrt
sqrt_trans <- trans_sqrt
