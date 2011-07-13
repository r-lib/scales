\name{time_trans}
\alias{time_trans}
\title{Transformation for times (class POSIXt).}
\description{
  Transformation for times (class POSIXt).
}
\examples{
hours <- seq(ISOdate(2000,3,20, tz = ""), by = "hour", length.out = 10)
t <- time_trans()
t$trans(hours)
t$inv(t$trans(hours))
t$format(t$breaks(range(hours)))
}

