\name{squish_infinite}
\alias{squish_infinite}
\title{Squish infinite values to range.}
\usage{squish_infinite(x, range=c(0, 1))}

\description{
  Squish infinite values to range.
}
\arguments{
  \item{x}{numeric vector of values to manipulate.}
  \item{range}{numeric vector of length two giving desired output range.}
}
\examples{squish_infinite(c(-Inf, -1, 0, 1, 2, Inf))}
