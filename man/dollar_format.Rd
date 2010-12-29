\name{dollar_format}
\title{Currency formatter: round to nearest cent and display dollar sign.}

\description{
  Currency formatter: round to nearest cent and display
  dollar sign.
}
\value{a function with single paramater x, a numeric vector, that
returns a character vector}
\alias{dollar_format}
\alias{dollar}
\examples{dollar_format()(c(100, 0.23, 1.456565, 2e3))
dollar_format()(c(1:10 * 10))
dollar(c(100, 0.23, 1.456565, 2e3))
dollar(c(1:10 * 10))}
