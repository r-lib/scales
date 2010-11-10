\name{gradient_2_pal}
\alias{gradient_2_pal}
\title{Colour gradient palette with mid-point (continous).}
\usage{gradient_2_pal(low=mnsl("10B 4/6"), mid=mnsl("N 8/0"),
    high=mnsl("10R 4/6"), space="Lab")}

\description{
  Colour gradient palette with mid-point (continous).
}
\examples{x <- seq(-1, 1, length = 100)
r <- sqrt(outer(x^2, x^2, "+"))
image(r, col = gradient_2_pal()(seq(0, 1, length = 12)))
image(r, col = gradient_2_pal()(seq(0, 1, length = 30)))
image(r, col = gradient_2_pal()(seq(0, 1, length = 100)))
image(r, col = gradient_2_pal(low = 
mnsl(complement("10R 4/6", fix = T)))(seq(0, 1, length = 100)))}
