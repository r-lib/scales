\name{trans_format}
\alias{trans_format}
\title{Format labels after transformation.}
\usage{trans_format(trans, format=force)}

\description{
  Format labels after transformation.
}
\value{a function with single paramater x, a numeric vector, that
returns a character vector of list of expressions}
\arguments{
  \item{trans}{transformation to apply}
  \item{format}{additional formatter to apply after transformation}
}
\examples{tf <- trans_format("log10", scientific_format())
tf(10 ^ 1:6)}
