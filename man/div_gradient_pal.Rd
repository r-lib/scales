\name{div_gradient_pal}
\alias{div_gradient_pal}
\title{Diverging colour gradient (continous).}
\usage{
  div_gradient_pal(low = mnsl("10B 4/6"),
    mid = mnsl("N 8/0"), high = mnsl("10R 4/6"),
    space = "Lab")
}
\arguments{
  \item{low}{colour for low end of gradient.}

  \item{mid}{colour for mid point}

  \item{high}{colour for high end of gradient.}

  \item{space}{colour space in which to calculate gradient.
  "Lab" usually best unless gradient goes through white.}
}
\description{
  Diverging colour gradient (continous).
}
\examples{
x <- seq(-1, 1, length = 100)
r <- sqrt(outer(x^2, x^2, "+"))
image(r, col = div_gradient_pal()(seq(0, 1, length = 12)))
image(r, col = div_gradient_pal()(seq(0, 1, length = 30)))
image(r, col = div_gradient_pal()(seq(0, 1, length = 100)))

library(munsell)
image(r, col = div_gradient_pal(low =
   mnsl(complement("10R 4/6", fix = TRUE)))(seq(0, 1, length = 100)))
}

