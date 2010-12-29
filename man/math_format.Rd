\name{math_format}
\alias{math_format}
\title{Add arbitrary expression to a label.}
\usage{math_format(expr=10^.x, format=force)}

\description{
  Add arbitrary expression to a label. The symbol that will
  be replace by the label value is \code{.x}.
}
\value{a function with single paramater x, a numeric vector, that
returns a list of expressions}
\seealso{\code{\link{plotmath}}}
\arguments{
  \item{expr}{expression to use}
  \item{format}{another format function to apply prior to mathematical 
transformation - this makes it easier to use floating point numbers in
mathematical expressions.}
}
\examples{math_format()(1:10)
math_format(alpha + frac(1, .x))(1:10)
math_format()(runif(10))
math_format(format = percent)(runif(10))}
