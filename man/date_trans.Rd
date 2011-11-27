\name{date_trans}
\alias{date_trans}
\title{Transformation for dates (class Date).}
\usage{
  date_trans()
}
\description{
  Transformation for dates (class Date).
}
\examples{
years <- seq(as.Date("1910/1/1"), as.Date("1999/1/1"), "years")
t <- date_trans()
t$trans(years)
t$inv(t$trans(years))
t$format(t$breaks(range(years)))
}

