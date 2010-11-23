\name{trans_breaks}
\alias{trans_breaks}
\title{Evenly spaced breaks on transformed scale.}
\usage{trans_breaks(trans, n=5, ...)}

\description{
  Evenly spaced breaks on transformed scale. These often do
  not produce very attractive breaks.
}
\arguments{
  \item{trans}{function of single variable, \code{x}, that given a numeric
vector returns the transformed values}
  \item{n}{desired number of ticks}
  \item{...}{other arguments passed on to pretty}
}
\examples{trans_breaks("log10")(c(1, 1e6))
trans_breaks("sqrt")(c(1, 100))
trans_breaks(function(x) 1 / x)(c(1, 100))
trans_breaks(function(x) -x)(c(1, 100))}
