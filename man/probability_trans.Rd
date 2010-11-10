\name{probability_trans}
\title{Probability transformation.}
\usage{probability_trans(distribution, ...)}

\description{
  Probability transformation.
}
\alias{probability_trans}
\alias{logit_trans,}
\alias{probit_trans}
\arguments{
  \item{distribution}{probability distribution.  Should be standard R
abbreviation so that "p" + distribution is a valid probability density
function, and "q" + distribution is a valid quantile function.}
  \item{...}{other arguments passed on to distribution and quantile functions}
}
