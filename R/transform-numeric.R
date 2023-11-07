#' Arc-sin square root transformation
#'
#' This is the variance stabilising transformation for the binomial
#' distribution.
#'
#' @export
#' @examples
#' plot(transform_asn(), xlim = c(0, 1))
transform_asn <- function() {
  new_transform(
    "asn",
    function(x) 2 * asin(sqrt(x)),
    function(x) sin(x / 2)^2,
    d_transform = function(x) 1 / sqrt(x - x^2),
    d_inverse = function(x) sin(x) / 2,
    domain = c(0, 1)
  )
}

#' @rdname transform_asn
#' @export
asn_trans <- transform_asn

#' Arc-tangent transformation
#'
#' @export
#' @examples
#' plot(transform_atanh(), xlim = c(-1, 1))
transform_atanh <- function() {
  new_transform(
    "atanh",
    "atanh",
    "tanh",
    d_transform = function(x) 1 / (1 - x^2),
    d_inverse = function(x) 1 / cosh(x)^2,
    domain = c(-1, 1)
  )
}

#' @export
#' @rdname transform_atanh
atanh_trans <- transform_atanh

#' Inverse Hyperbolic Sine transformation
#'
#' @export
#' @examples
#' plot(transform_asinh(), xlim = c(-1e2, 1e2))
transform_asinh <- function() {
  new_transform(
    "asinh",
    transform = asinh,
    inverse = sinh,
    d_transform = function(x) 1 / sqrt(x^2 + 1),
    d_inverse = cosh
  )
}

#' @export
#' @rdname transform_asinh
asinh_trans <- transform_asinh

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
#'   otherwise any non-negative constant (Box-Cox type 2). `transform_modulus()`
#'   sets the default to 1.
#' @seealso [transform_yj()]
#' @references Box, G. E., & Cox, D. R. (1964). An analysis of transformations.
#' Journal of the Royal Statistical Society. Series B (Methodological), 211-252.
#' \url{https://www.jstor.org/stable/2984418}
#'
#' John, J. A., & Draper, N. R. (1980).
#' An alternative family of transformations. Applied Statistics, 190-197.
#' \url{https://www.jstor.org/stable/2986305}
#' @export
#' @examples
#' plot(transform_boxcox(-1), xlim = c(0, 10))
#' plot(transform_boxcox(0), xlim = c(0, 10))
#' plot(transform_boxcox(1), xlim = c(0, 10))
#' plot(transform_boxcox(2), xlim = c(0, 10))
#'
#' plot(transform_modulus(-1), xlim = c(-10, 10))
#' plot(transform_modulus(0), xlim = c(-10, 10))
#' plot(transform_modulus(1), xlim = c(-10, 10))
#' plot(transform_modulus(2), xlim = c(-10, 10))
transform_boxcox <- function(p, offset = 0) {
  if (abs(p) < 1e-07) {
    trans <- function(x) log(x + offset)
    inv <- function(x) exp(x) - offset
    d_trans <- function(x) 1 / (x + offset)
    d_inv <- "exp"
  } else {
    trans <- function(x) ((x + offset)^p - 1) / p
    inv <- function(x) (x * p + 1)^(1 / p) - offset
    d_trans <- function(x) (x + offset)^(p - 1)
    d_inv <- function(x) (x * p + 1)^(1 / p - 1)
  }

  trans_with_check <- function(x) {
    if (any((x + offset) < 0, na.rm = TRUE)) {
      cli::cli_abort(c(
        "{.fun transform_boxcox} must be given only positive values",
        i = "Consider using {.fun transform_modulus} instead?"
      ))
    }
    trans(x)
  }

  new_transform(
    paste0("pow-", format(p)),
    trans_with_check,
    inv,
    d_transform = d_trans,
    d_inverse = d_inv,
    domain = c(0, Inf)
  )
}

#' @export
#' @rdname transform_boxcox
boxcox_trans <- transform_boxcox

#' @rdname transform_boxcox
#' @export
transform_modulus <- function(p, offset = 1) {
  if (abs(p) < 1e-07) {
    trans <- function(x) sign(x) * log(abs(x) + offset)
    inv <- function(x) sign(x) * (exp(abs(x)) - offset)
    d_trans <- function(x) 1 / (abs(x) + offset)
    d_inv <- function(x) exp(abs(x))
  } else {
    trans <- function(x) sign(x) * ((abs(x) + offset)^p - 1) / p
    inv <- function(x) sign(x) * ((abs(x) * p + 1)^(1 / p) - offset)
    d_trans <- function(x) (abs(x) + offset)^(p - 1)
    d_inv <- function(x) (abs(x) * p + 1)^(1 / p - 1)
  }
  new_transform(
    paste0("mt-pow-", format(p)), trans, inv,
    d_transform = d_trans, d_inverse = d_inv
  )
}

#' @rdname transform_boxcox
#' @export
modulus_trans <- transform_modulus

#' Yeo-Johnson transformation
#'
#' The Yeo-Johnson transformation is a flexible transformation that is similar
#' to Box-Cox, [transform_boxcox()], but does not require input values to be
#' greater than zero.
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
#' \url{https://www.jstor.org/stable/2673623}
#' @export
#' @examples
#' plot(transform_yj(-1), xlim = c(-10, 10))
#' plot(transform_yj(0), xlim = c(-10, 10))
#' plot(transform_yj(1), xlim = c(-10, 10))
#' plot(transform_yj(2), xlim = c(-10, 10))
transform_yj <- function(p) {
  eps <- 1e-7

  if (abs(p) < eps) {
    trans_pos <- log1p
    inv_pos <- expm1
    d_trans_pos <- function(x) 1 / (1 + x)
    d_inv_pos <- exp
  } else {
    trans_pos <- function(x) ((x + 1)^p - 1) / p
    inv_pos <- function(x) (p * x + 1)^(1 / p) - 1
    d_trans_pos <- function(x) (x + 1)^(p - 1)
    d_inv_pos <- function(x) (p * x + 1)^(1 / p - 1)
  }

  if (abs(2 - p) < eps) {
    trans_neg <- function(x) -log1p(-x)
    inv_neg <- function(x) 1 - exp(-x)
    d_trans_neg <- function(x) 1 / (1 - x)
    d_inv_new <- function(x) exp(-x)
  } else {
    trans_neg <- function(x) -((-x + 1)^(2 - p) - 1) / (2 - p)
    inv_neg <- function(x) 1 - (-(2 - p) * x + 1)^(1 / (2 - p))
    d_trans_neg <- function(x) (1 - x)^(1 - p)
    d_inv_neg <- function(x) (-(2 - p) * x + 1)^(1 / (2 - p) - 1)
  }

  new_transform(
    paste0("yeo-johnson-", format(p)),
    function(x) trans_two_sided(x, trans_pos, trans_neg),
    function(x) trans_two_sided(x, inv_pos, inv_neg),
    d_transform = function(x) trans_two_sided(x, d_trans_pos, d_trans_neg, f_at_0 = 1),
    d_inverse = function(x) trans_two_sided(x, d_inv_pos, d_inv_neg, f_at_0 = 1)
  )
}

#' @export
#' @rdname transform_yj
yj_trans <- transform_yj

trans_two_sided <- function(x, pos, neg, f_at_0 = 0) {
  out <- rep(NA_real_, length(x))
  present <- !is.na(x)
  out[present & x > 0] <- pos(x[present & x > 0])
  out[present & x < 0] <- neg(x[present & x < 0])
  out[present & x == 0] <- f_at_0
  out
}

#' Exponential transformation (inverse of log transformation)
#'
#' @param base Base of logarithm
#' @export
#' @examples
#' plot(transform_exp(0.5), xlim = c(-2, 2))
#' plot(transform_exp(1), xlim = c(-2, 2))
#' plot(transform_exp(2), xlim = c(-2, 2))
#' plot(transform_exp(), xlim = c(-2, 2))
transform_exp <- function(base = exp(1)) {
  force(base)
  new_transform(
    paste0("power-", format(base)),
    function(x) base^x,
    function(x) log(x, base = base),
    d_transform = function(x) base^x * log(base),
    d_inverse = function(x) 1 / x / log(base)
  )
}

#' @export
#' @rdname transform_exp
exp_trans <- transform_exp

#' Identity transformation (do nothing)
#'
#' @export
#' @examples
#' plot(transform_identity(), xlim = c(-1, 1))
transform_identity <- function() {
  new_transform(
    "identity",
    "force",
    "force",
    d_transform = function(x) rep(1, length(x)),
    d_inverse = function(x) rep(1, length(x))
  )
}

#' @export
#' @rdname transform_identity
identity_trans <- transform_identity


#' Log transformations
#'
#' * `transform_log()`: `log(x)`
#' * `log1p()`: `log(x + 1)`
#' * `transform_pseudo_log()`:  smoothly transition to linear scale around 0.
#'
#' @param base base of logarithm
#' @export
#' @examples
#' plot(transform_log2(), xlim = c(0, 5))
#' plot(transform_log(), xlim = c(0, 5))
#' plot(transform_log10(), xlim = c(0, 5))
#'
#' plot(transform_log(), xlim = c(0, 2))
#' plot(transform_log1p(), xlim = c(-1, 1))
#'
#' # The pseudo-log is defined for all real numbers
#' plot(transform_pseudo_log(), xlim = c(-5, 5))
#' lines(transform_log(), xlim = c(0, 5), col = "red")
#'
#' # For large positives numbers it's very close to log
#' plot(transform_pseudo_log(), xlim = c(1, 20))
#' lines(transform_log(), xlim = c(1, 20), col = "red")
transform_log <- function(base = exp(1)) {
  force(base)
  new_transform(
    paste0("log-", format(base)),
    function(x) log(x, base),
    function(x) base^x,
    d_transform = function(x) 1 / x / log(base),
    d_inverse = function(x) base^x * log(base),
    breaks = log_breaks(base = base),
    domain = c(1e-100, Inf)
  )
}
#' @export
#' @rdname transform_log
transform_log10 <- function() {
  transform_log(10)
}

#' @export
#' @rdname transform_log
transform_log2 <- function() {
  transform_log(2)
}

#' @rdname transform_log
#' @export
transform_log1p <- function() {
  new_transform(
    "log1p",
    "log1p",
    "expm1",
    d_transform = function(x) 1 / (1 + x),
    d_inverse = "exp",
    domain = c(-1 + .Machine$double.eps, Inf)
  )
}

#' @export
#' @rdname transform_log
log_trans   <- transform_log
#' @export
#' @rdname transform_log
log10_trans <- transform_log10
#' @export
#' @rdname transform_log
log2_trans  <- transform_log2
#' @export
#' @rdname transform_log
log1p_trans <- transform_log1p


#' @rdname transform_log
#' @param sigma Scaling factor for the linear part of pseudo-log transformation.
#' @export
transform_pseudo_log <- function(sigma = 1, base = exp(1)) {
  new_transform(
    "pseudo_log",
    function(x) asinh(x / (2 * sigma)) / log(base),
    function(x) 2 * sigma * sinh(x * log(base)),
    d_transform = function(x) 1 / (sqrt(4 + x^2/sigma^2) * sigma * log(base)),
    d_inverse = function(x) 2 * sigma * cosh(x * log(base)) * log(base)
  )
}

#' @export
#' @rdname transform_log
pseudo_log_trans <- transform_pseudo_log

#' Probability transformation
#'
#' @param distribution probability distribution.  Should be standard R
#'   abbreviation so that "p" + distribution is a valid cumulative distribution
#'   function, "q" + distribution is a valid quantile function, and
#'   "d" + distribution is a valid probability density function.
#' @param ... other arguments passed on to distribution and quantile functions
#' @export
#' @examples
#' plot(transform_logit(), xlim = c(0, 1))
#' plot(transform_probit(), xlim = c(0, 1))
transform_probability <- function(distribution, ...) {
  qfun <- match.fun(paste0("q", distribution))
  pfun <- match.fun(paste0("p", distribution))
  dfun <- match.fun(paste0("d", distribution))

  new_transform(
    paste0("prob-", distribution),
    function(x) qfun(x, ...),
    function(x) pfun(x, ...),
    d_transform = function(x) 1 / dfun(qfun(x, ...), ...),
    d_inverse = function(x) dfun(x, ...),
    domain = c(0, 1)
  )
}

#' @export
#' @rdname transform_probability
transform_logit <- function() transform_probability("logis")
#' @export
#' @rdname transform_probability
transform_probit <- function() transform_probability("norm")


#' @export
#' @rdname transform_probability
probability_trans <- transform_probability
#' @export
#' @rdname transform_probability
logit_trans <- transform_logit
#' @export
#' @rdname transform_probability
probit_trans <- transform_probit


#' Reciprocal transformation
#'
#' @export
#' @examples
#' plot(transform_reciprocal(), xlim = c(0, 1))
transform_reciprocal <- function() {
  new_transform(
    "reciprocal",
    function(x) 1 / x,
    function(x) 1 / x,
    d_transform = function(x) -1 / x^2,
    d_inverse = function(x) -1 / x^2
  )
}

#' @export
#' @rdname transform_reciprocal
reciprocal_trans <- transform_reciprocal

#' Reverse transformation
#'
#' reversing transformation works by multiplying the input with -1. This means
#' that reverse transformation cannot easily be composed with transformations
#' that require positive input unless the reversing is done as a final step.
#'
#' @export
#' @examples
#' plot(transform_reverse(), xlim = c(-1, 1))
transform_reverse <- function() {
  new_transform(
    "reverse",
    function(x) -x,
    function(x) -x,
    d_transform = function(x) rep(-1, length(x)),
    d_inverse = function(x) rep(-1, length(x)),
    minor_breaks = regular_minor_breaks(reverse = TRUE)
  )
}

#' @export
#' @rdname transform_reverse
reverse_trans <- transform_reverse

#' Square-root transformation
#'
#' This is the variance stabilising transformation for the Poisson
#' distribution.
#'
#' @export
#' @examples
#' plot(transform_sqrt(), xlim = c(0, 5))
transform_sqrt <- function() {
  new_transform(
    "sqrt",
    "sqrt",
    function(x) ifelse(x < 0, NA_real_, x ^ 2),
    d_transform = function(x) 0.5 / sqrt(x),
    d_inverse = function(x) 2 * x,
    domain = c(0, Inf)
  )
}

#' @export
#' @rdname transform_sqrt
sqrt_trans <- transform_sqrt
