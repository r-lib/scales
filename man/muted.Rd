\name{muted}
\alias{muted}
\title{Mute standard colour.}
\usage{
  muted(colour, l = 30, c = 70)
}
\arguments{
  \item{colour}{character vector of colours to modify}

  \item{l}{new luminance}

  \item{c}{new chroma}
}
\description{
  Mute standard colour.
}
\examples{
muted("red")
muted("blue")
show_col(c("red", "blue", muted("red"), muted("blue")))
}

