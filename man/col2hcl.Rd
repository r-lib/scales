\name{col2hcl}
\alias{col2hcl}
\title{Modify standard R colour in hcl colour space.}
\usage{col2hcl(colour, h, c, l, alpha=1)}

\description{
  Modify standard R colour in hcl colour space. Transforms
  rgb to hcl, sets non-missing arguments and then
  backtransforms to rgb.
}
\examples{col2hcl(colors())}
