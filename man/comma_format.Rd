\name{comma_format}
\title{Comma formatter: format number with commas separating thousands.}
\usage{comma_format(...)}

\description{
  Comma formatter: format number with commas separating
  thousands.
}
\value{a function with single paramater x, a numeric vector, that
returns a character vector}
\alias{comma_format}
\alias{comma}
\arguments{
  \item{...}{other arguments passed on to \code{\link{formatC}}}
}
\examples{comma_format()(c(1, 1e3, 2000, 1e6))
comma_format(digits = 9)(c(1, 1e3, 2000, 1e6))
comma(c(1, 1e3, 2000, 1e6))}
