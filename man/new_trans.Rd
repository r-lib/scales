\name{new_trans}
\alias{new_trans}
\title{Create a new transformation function.}
\usage{new_trans(name, transform, inverse,
    breaks=pretty_breaks(transform),
    format=trans_format(inverse))}

\description{
  Create a new transformation function.
}
\arguments{
  \item{name}{transformation name}
  \item{transform}{function, or name of function, that performs the}
  \item{inverse}{function, or name of function, that performs the}
  \item{breaks}{default breaks function for this transformation. The breaks
function is applied on the transformed scale.}
  \item{format}{default format for this transformation. The format is applied
to breaks generated on the transformed scale.}
}
