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
  \item{x}{data to rescale}
  \item{to}{range to scale to}
  \item{from}{range to scale from, defaults to range of data}
}
