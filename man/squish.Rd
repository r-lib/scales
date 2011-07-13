\name{squish}
\alias{squish}
\title{Squish values into range.}
\usage{
  squish(x, range = c(0, 1))
}
\arguments{
  \item{x}{numeric vector of values to manipulate.}

  \item{range}{numeric vector of length two giving desired
  output range.}
}
\description{
  Squish values into range.
}
\examples{
squish(c(-1, 0.5, 1, 2, NA))
squish(c(-1, 0, 0.5, 1, 2))
}
\author{
  Homer Strong <homer.strong@gmail.com>
}

