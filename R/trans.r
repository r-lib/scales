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
#'   transformation
#' @param inverse function, or name of function, that performs the
#'   inverse of the transformation
#' @param breaks default breaks function for this transformation. The breaks
#'   function is applied to the raw data.
#' @param format default format for this transformation. The format is applied
#'   to breaks generated to the raw data.
#' @param domain domain, as numeric vector of length 2, over which 
#'   transformation is valued
#' @seealso \Sexpr[results=rd,stage=build]{scales:::seealso_trans()}
#' @export trans_new is.trans
#' @aliases trans_new trans is.trans
#' @S3method print trans
trans_new <- function(name, transform, inverse, breaks = pretty_breaks(), format = format_format(), domain = c(-Inf, Inf)) {
  if (is.character(transform)) transform <- match.fun(transform)
  if (is.character(inverse)) inverse <- match.fun(inverse)
  
  structure(list(name = name, transform = transform, inverse = inverse,
    breaks = breaks, format = format, domain = domain), 
    class = "trans")
}

is.trans <- function(x) inherits(x, "trans")
print.trans <- function(x, ...) cat("Transformer: ", x$name)

#' Convert character string to transformer.
#'
#' @param x name of transformer
#' @export
as.trans <- function(x) {
  if (is.trans(x)) return(x)
  
  f <- str_c(x, "_trans")
  match.fun(f)()
}

#' Compute range of transformed values.
#'
#' Silently drops any ranges outside of the domain of \code{trans}.
#'
#' @param trans a transformation object, or the name of a transformation object
#'   given as a string.
#' @param x a numeric vector to compute the rande of
#' @export
trans_range <- function(trans, x) {
  trans <- as.trans(trans)
  range(trans$trans(range(squish(x, trans$domain), na.rm = TRUE)))
}
