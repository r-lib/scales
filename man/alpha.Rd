\name{alpha}
\alias{alpha}
\title{Modify colour transparency.}
\usage{alpha(colour, alpha)}

\description{
  Modify colour transparency. Vectorised in both colour and
  alpha.
}
\arguments{
  \item{colour}{colour}
  \item{alpha}{new alpha level in [0,1]}
}
\examples{alpha("red", 0.1)
alpha(colours(), 0.5)
alpha("red", seq(0, 1, length = 10))}
