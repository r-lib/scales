\name{trans_range}
\alias{trans_range}
\title{Compute range of transformed values.}
\usage{trans_range(trans, x)}

\description{
  Compute range of transformed values.
}

\details{
  Silently drops any ranges outside of the domain of
  \code{trans}.
}
\arguments{
  \item{trans}{a transformation object, or the name of a transformation object
given as a string.}
  \item{x}{a numeric vector to compute the rande of}
}
