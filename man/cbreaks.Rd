\name{cbreaks}
\alias{cbreaks}
\title{Compute breaks for continuous scale.}
\usage{
  cbreaks(range, breaks = pretty_breaks(),
    labels = scientific_format())
}
\arguments{
  \item{range}{numeric vector of length 2 giving the range
  of the underlying data}

  \item{breaks}{either a vector of break values, or a break
  function that will make a vector of breaks when given the
  range of the data}

  \item{labels}{either a vector of labels (character vector
  or list of expression) or a format function that will
  make a vector of labels when called with a vector of
  breaks. Labels can only be specified manually if breaks
  are - it is extremely dangerous to supply labels if you
  don't know what the breaks will be.}
}
\description{
  This function wraps up the components needed to go from a
  continuous range to a set of breaks and labels suitable
  for display on axes or legends.
}
\examples{
cbreaks(c(0, 100))
cbreaks(c(0, 100), pretty_breaks(3))
cbreaks(c(0, 100), pretty_breaks(10))
cbreaks(c(1, 100), log_breaks())
cbreaks(c(1, 1e4), log_breaks())

cbreaks(c(0, 100), labels = math_format())
cbreaks(c(0, 1), labels = percent_format())
cbreaks(c(0, 1e6), labels = comma_format())
cbreaks(c(0, 1e6), labels = dollar_format())
cbreaks(c(0, 30), labels = dollar_format())

# You can also specify them manually:
cbreaks(c(0, 100), breaks = c(15, 20, 80))
cbreaks(c(0, 100), breaks = c(15, 20, 80), labels = c(1.5, 2.0, 8.0))
cbreaks(c(0, 100), breaks = c(15, 20, 80),
  labels = expression(alpha, beta, gamma))
}

