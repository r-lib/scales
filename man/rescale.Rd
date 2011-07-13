\name{rescale}
\alias{rescale}
\title{Rescale numeric vector to have specified minimum and maximum.}
\usage{
  rescale(x, to = c(0, 1), from = range(x, na.rm = TRUE))
}
\arguments{
  \item{x}{numeric vector of values to manipulate.}

  \item{to}{output range (numeric vector of length two)}

  \item{from}{input range (numeric vector of length two).
  If not given, is calculated from the range of \code{x}}
}
\description{
  Rescale numeric vector to have specified minimum and
  maximum.
}
\examples{
rescale(1:100)
rescale(runif(50))
rescale(1)
}
\keyword{manip}

