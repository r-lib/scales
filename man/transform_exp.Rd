% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transform-numeric.R
\name{transform_exp}
\alias{transform_exp}
\alias{exp_trans}
\title{Exponential transformation (inverse of log transformation)}
\usage{
transform_exp(base = exp(1))

exp_trans(base = exp(1))
}
\arguments{
\item{base}{Base of logarithm}
}
\description{
Exponential transformation (inverse of log transformation)
}
\examples{
plot(transform_exp(0.5), xlim = c(-2, 2))
plot(transform_exp(1), xlim = c(-2, 2))
plot(transform_exp(2), xlim = c(-2, 2))
plot(transform_exp(), xlim = c(-2, 2))
}
