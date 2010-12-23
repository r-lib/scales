\name{cscale}
\alias{cscale}
\title{Continuous scale.}
\usage{cscale(x, palette, na.value=NA, trans=identity_trans())}

\description{
  Continuous scale.
}
\arguments{
  \item{x}{vector of continuous values to scale}
  \item{palette}{palette to use. 

Palettes included in package:
\Sexpr[results=rd]{scales:::seealso_pal()}}
  \item{na.value}{value to use for missing values}
  \item{trans}{transformation object describing the how to transform the
raw data prior to scaling.  Defaults to the identity transformation which
leaves the data unchanged. 

Transformations included in package:
\Sexpr[results=rd]{scales:::seealso_trans()}.}
}
\examples{with(mtcars, plot(disp, mpg, cex = cscale(hp, size_pal())))
with(mtcars, plot(disp, mpg, cex = cscale(hp, size_pal(), 
trans = sqrt_trans())))
with(mtcars, plot(disp, mpg, cex = cscale(hp, area_pal())))
with(mtcars, plot(disp, mpg, pch = 20, cex = 5, 
col = cscale(hp, seq_gradient_pal("grey80", "black"))))}
