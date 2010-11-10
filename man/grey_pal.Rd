\name{grey_pal}
\alias{grey_pal}
\title{Grey scale palette (discrete).}
\usage{grey_pal(start=0.2, end=0.8)}

\description{
  Grey scale palette (discrete).
}
\seealso{\code{\link{seq_gradient_pal}} for continuous version}
\arguments{
  \item{start}{gray value at low end of palette}
  \item{end}{gray value at high end of palette}
}
\examples{show_col(grey_pal()(25))
show_col(grey_pal(0, 1)(25))}
