\name{trans_breaks}
\alias{trans_breaks}
\title{Evenly spaced breaks on transformed scale.}
\usage{trans_breaks(trans, n=5, ...)}

\description{
  Evenly spaced breaks on transformed scale. These often do
  not produce very attractive breaks.
}
\examples{trans_breaks(log10_trans())(c(1, 1e6))
trans_breaks(sqrt_trans())(c(1, 100))
trans_breaks(reciprocal_trans())(c(1, 100))
trans_breaks(reverse_trans())(c(1, 100))}
