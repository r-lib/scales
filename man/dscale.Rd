\name{dscale}
\alias{dscale}
\title{Discrete scale...}
\usage{dscale(x, palette)}

\description{
  Discrete scale
}
\arguments{
  \item{x}{vector of discrete values to scale}
  \item{palette}{aesthetic palette to use}
}
\examples{with(mtcars, plot(disp, mpg, pch = 20, cex = 3,
col = dscale(factor(cyl), brewer_pal())))}
