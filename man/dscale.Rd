\name{dscale}
\alias{dscale}
\title{Discrete scale...}
\usage{dscale(x, palette)}

\description{
  Discrete scale
}
\examples{with(mtcars, plot(disp, mpg, pch = 20, cex = 3,
col = dscale(factor(cyl), brewer_pal())))}
