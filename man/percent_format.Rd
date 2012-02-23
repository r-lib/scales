\name{percent_format}
\alias{percent}
\alias{percent_format}
\title{Percent formatter: multiply by one hundred and display percent sign.}
\usage{
  percent_format()

  percent(x)
}
\arguments{
  \item{x}{a numeric vector to format}
}
\value{
  a function with single paramater x, a numeric vector,
  that returns a character vector
}
\description{
  Percent formatter: multiply by one hundred and display
  percent sign.
}
\examples{
percent_format()(runif(10))
percent(runif(10))
percent(runif(10, 1, 10))
}

