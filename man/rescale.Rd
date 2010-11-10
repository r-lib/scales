\name{rescale}
\alias{rescale}
\title{Rescale numeric vector to have specified minimum and maximum.}
\usage{rescale(x, to=c(0, 1), from=range(x, na.rm = TRUE))}

\description{
  Rescale numeric vector to have specified minimum and
  maximum.
}
\keyword{manip}
\arguments{
  \item{x}{numeric vector of values to manipulate.}
  \item{to}{output range (numeric vector of length two)}
  \item{from}{input range (numeric vector of length two).  If not given, is
calculated from the range of \code{x}}
}
