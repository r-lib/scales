\name{cscale}
\alias{cscale}
\title{Continuous scale...}
\usage{cscale(x, palette)}

\description{
  Continuous scale
}
\arguments{
  \item{x}{vector of continuous values to scale}
  \item{palette}{aesthetic palette to use}
}
\examples{with(mtcars, plot(disp, mpg, cex = cscale(hp, size_pal())))
with(mtcars, plot(disp, mpg, cex = cscale(hp, area_pal())))
with(mtcars, plot(disp, mpg, pch = 20, cex = 5, 
col = cscale(hp, seq_gradient_pal("grey80", "black"))))}
