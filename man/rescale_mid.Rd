\name{rescale_mid}
\alias{rescale_mid}
\title{Rescale numeric vector to have specified minimum, midpoint, and maximum.}
\usage{
  rescale_mid(x, to = c(0, 1),
    from = range(x, na.rm = TRUE), mid = 0)
}
\arguments{
  \item{x}{numeric vector of values to manipulate.}

  \item{to}{output range (numeric vector of length two)}

  \item{from}{input range (numeric vector of length two).
  If not given, is calculated from the range of \code{x}}

  \item{mid}{mid-point of input range}
}
\description{
  Rescale numeric vector to have specified minimum,
  midpoint, and maximum.
}
\examples{
rescale_mid(1:100, mid = 50.5)
rescale_mid(runif(50), mid = 0.5)
rescale_mid(1)
}

