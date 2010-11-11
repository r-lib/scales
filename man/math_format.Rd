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
