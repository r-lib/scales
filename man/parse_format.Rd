\name{parse_format}
\alias{parse_format}
\title{Parse a text label to produce expressions for plotmath.}
\arguments{
  \item{x}{character vector to format}
}
\value{
  a function with single paramater x, a character vector,
  that returns a list of expressions
}
\description{
  Parse a text label to produce expressions for plotmath.
}
\examples{
parse_format()(c("alpha", "beta", "gamma"))
}
\seealso{
  \code{\link{plotmath}}
}

