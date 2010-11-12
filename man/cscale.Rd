\name{cscale}
\alias{cscale}
\title{Continuous scale...}
\usage{cscale(x, palette, na.value=NA, trans=identity_trans())}

\description{
  Continuous scale
}
\arguments{
  \item{x}{vector of continuous values to scale}
  \item{palette}{aesthetic palette to use}
  \item{NA.value}{aesthetic to use for missing values}
  \item{trans}{transformation object describing the how to transform the
raw data prior to scaling.  Defaults to the identity transformation which
leaves the data unchanged.}
}
\examples{with(mtcars, plot(disp, mpg, cex = cscale(hp, size_pal())))
with(mtcars, plot(disp, mpg, cex = cscale(hp, area_pal())))
with(mtcars, plot(disp, mpg, pch = 20, cex = 5, 
col = cscale(hp, seq_gradient_pal("grey80", "black"))))}
