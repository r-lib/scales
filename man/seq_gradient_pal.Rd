\name{seq_gradient_pal}
\alias{seq_gradient_pal}
\title{Sequential colour gradient palette (continous).}
\usage{
  seq_gradient_pal(low = mnsl("10B 4/6"), high = mnsl("10R 4/6"), space = "Lab")
}
\arguments{
  \item{low}{colour for low end of gradient.}

  \item{high}{colour for high end of gradient.}

  \item{space}{colour space in which to calculate gradient.
  "Lab" usually best unless gradient goes through white.}
}
\description{
  Sequential colour gradient palette (continous).
}
\examples{
x <- seq(0, 1, length = 25)
show_col(seq_gradient_pal()(x))
show_col(seq_gradient_pal("white", "black")(x))

library(munsell)
show_col(seq_gradient_pal("white", mnsl("10R 4/6"))(x))
}

