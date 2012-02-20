\name{censor}
\alias{censor}
\title{Censor any values outside of range.}
\usage{
  censor(x, range = c(0, 1), only.finite = TRUE)
}
\arguments{
  \item{x}{numeric vector of values to manipulate.}

  \item{range}{numeric vector of length two giving desired
  output range.}

  \item{only.finite}{if \code{TRUE} (the default), will
  only modify finite values.}
}
\description{
  Censor any values outside of range.
}
\examples{
censor(c(-1, 0.5, 1, 2, NA))
}

