\name{log_breaks}
\alias{log_breaks}
\title{Log breaks (integer breaks on log-transformed scales).}
\usage{log_breaks(n=5, base=10)}

\description{
  Log breaks (integer breaks on log-transformed scales).
}
\arguments{
  \item{n}{desired number of breaks}
  \item{base}{base of logarithm to use}
}
\examples{log_breaks()(c(1, 1e6))
log_breaks()(c(1, 1e5))}
