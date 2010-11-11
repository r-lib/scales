\name{col2hcl}
\alias{col2hcl}
\title{Modify standard R colour in hcl colour space.}
\usage{col2hcl(colour, h, c, l, alpha=1)}

\description{
  Modify standard R colour in hcl colour space.
}

\details{
  Transforms rgb to hcl, sets non-missing arguments and
  then backtransforms to rgb.
}
\arguments{
  \item{colour}{character vector of colours to be modified}
  \item{h}{new hue}
  \item{l}{new luminance}
  \item{c}{new chroma}
  \item{alpha}{alpha value.  Defaults to 1.}
}
\examples{col2hcl(colors())}
