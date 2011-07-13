\name{comma_format}
\alias{comma}
\alias{comma_format}
\title{Comma formatter: format number with commas separating thousands.}
\usage{
  comma_format(...)
}
\arguments{
  \item{...}{other arguments passed on to
  \code{\link{formatC}}}
}
\value{
  a function with single paramater x, a numeric vector,
  that returns a character vector
}
\description{
  Comma formatter: format number with commas separating
  thousands.
}
\examples{
comma_format()(c(1, 1e3, 2000, 1e6))
comma_format(digits = 9)(c(1, 1e3, 2000, 1e6))
comma(c(1, 1e3, 2000, 1e6))
}

