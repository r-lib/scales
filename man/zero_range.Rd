\name{zero_range}
\alias{zero_range}
\title{Determine if range of vector is indistinguishable from floating-point 0.}
\usage{
  zero_range(x)
}
\arguments{
  \item{x}{numeric range: vector of length 2}
}
\value{
  logical \code{TRUE} if the relative difference of the
  endpoints of the range are not distinguishable from 0.
}
\description{
  Determine if range of vector is indistinguishable from
  floating-point 0.
}

