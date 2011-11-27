\name{dscale}
\alias{dscale}
\title{Discrete scale.}
\usage{
  dscale(x, palette, na.value = NA)
}
\arguments{
  \item{x}{vector of discrete values to scale}

  \item{palette}{aesthetic palette to use}

  \item{na.value}{aesthetic to use for missing values}
}
\description{
  Discrete scale.
}
\examples{
with(mtcars, plot(disp, mpg, pch = 20, cex = 3,
  col = dscale(factor(cyl), brewer_pal())))
}

