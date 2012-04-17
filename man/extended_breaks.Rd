\name{extended_breaks}
\alias{extended_breaks}
\title{Extended breaks.
Uses Wilkinon's extended breaks algorithm as implemented in the
\pkg{labeling} package.}
\usage{
  extended_breaks(n = 5, ...)
}
\arguments{
  \item{n}{desired number of breaks}

  \item{...}{other arguments passed on to
  \code{\link[labeling]{extended}}}
}
\description{
  Extended breaks. Uses Wilkinon's extended breaks
  algorithm as implemented in the \pkg{labeling} package.
}
\examples{
extended_breaks()(1:10)
extended_breaks()(1:100)
}
\references{
  Talbot, J., Lin, S., Hanrahan, P. (2010) An Extension of
  Wilkinson's Algorithm for Positioning Tick Labels on
  Axes, InfoVis 2010.
}

