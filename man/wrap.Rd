\name{wrap}
\alias{wrap}
\title{Wrap text to a specified width, adding newlines for spaces if text exceeds
width}
\usage{
  wrap(width)
}
\arguments{
  \item{width}{width above which to wrap}
}
\value{
  a function with single paramater x, a character vector,
  that returns a character vector
}
\description{
  Wrap text to a specified width, adding newlines for
  spaces if text exceeds width
}
\examples{
wrap_10 <- wrap(10)
wrap_10('A long line that needs to be wrapped')
}

