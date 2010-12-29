\name{percent_format}
\title{Percent formatter: multiply by one hundred and display percent sign.}

\description{
  Percent formatter: multiply by one hundred and display
  percent sign.
}
\value{a function with single paramater x, a numeric vector, that
returns a character vector}
\alias{percent_format}
\alias{percent}
\examples{percent_format()(runif(10))
percent(runif(10))
percent(runif(10, 1, 10))}
