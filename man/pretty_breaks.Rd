\name{pretty_breaks}
\alias{pretty_breaks}
\title{Pretty breaks.
Uses default R break algorithm as implemented in \code{\link{pretty}}.}
\usage{
  pretty_breaks(n = 5, ...)
}
\arguments{
  \item{n}{desired number of breaks}

  \item{...}{other arguments passed on to
  \code{\link{pretty}}}
}
\description{
  Pretty breaks. Uses default R break algorithm as
  implemented in \code{\link{pretty}}.
}
\examples{
pretty_breaks()(1:10)
pretty_breaks()(1:100)
pretty_breaks()(as.Date(c("2008-01-01", "2009-01-01")))
pretty_breaks()(as.Date(c("2008-01-01", "2090-01-01")))
}

