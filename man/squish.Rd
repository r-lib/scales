\name{squish}
\alias{squish}
\title{Squish values into range.}
\usage{
  squish(x, range = c(0, 1), only.finite = TRUE)
}
\arguments{
  \item{x}{numeric vector of values to manipulate.}

  \item{range}{numeric vector of length two giving desired
  output range.}

  \item{only.finite}{if \code{TRUE} (the default), will
  only modify finite values.}
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

