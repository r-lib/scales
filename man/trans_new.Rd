\name{trans_new}
\title{Create a new transformation object.}
\usage{trans_new(name, transform, inverse, breaks=pretty_breaks(),
    format=scientific_format())}

\description{
  Create a new transformation object.
}

\details{
  A transformation encapsulates a transformation and its
  inverse, as well as the information needed to create
  pleasing breaks and labels. The breaks function is
  applied on the transformed range of the range, and it's
  expected that the labels function will perform some kind
  of inverse tranformation on these breaks to give them
  labels that are meaningful on the original scale.
}
\seealso{\Sexpr[results=rd]{scales:::seealso_trans()}}
\alias{trans_new}
\alias{trans}
\arguments{
  \item{name}{transformation name}
  \item{transform}{function, or name of function, that performs the}
  \item{inverse}{function, or name of function, that performs the}
  \item{breaks}{default breaks function for this transformation. The breaks
function is applied to the raw data.}
  \item{format}{default format for this transformation. The format is applied
to breaks generated to the raw data.}
}
