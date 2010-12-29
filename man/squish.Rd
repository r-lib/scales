\name{squish}
\alias{squish}
\title{Squish values into range.}
\usage{squish(x, range=c(0, 1))}

\description{
  Squish values into range.
}
\author{Homer Strong <homer.strong@gmail.com>}
\arguments{
  \item{x}{numeric vector of values to manipulate.}
  \item{range}{numeric vector of length two giving desired output range.}
}
\examples{squish(c(-1, 0.5, 1, 2, NA))
squish(c(-1, 0, 0.5, 1, 2))}
