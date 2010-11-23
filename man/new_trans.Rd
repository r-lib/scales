\name{new_trans}
\alias{new_trans}
\title{Create a new transformation object.}
\usage{new_trans(name, transform, inverse,
    breaks=pretty_breaks(transform),
    format=trans_format(inverse))}

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
\arguments{
  \item{name}{transformation name}
  \item{transform}{function, or name of function, that performs the}
  \item{inverse}{function, or name of function, that performs the}
  \item{breaks}{default breaks function for this transformation. The breaks
function is applied on the transformed scale.}
  \item{format}{default format for this transformation. The format is applied
to breaks generated on the transformed scale.}
}
