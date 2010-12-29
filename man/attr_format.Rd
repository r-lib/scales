\name{attr_format}
\alias{attr_format}
\title{Format with labels attribute, if present.}

\description{
  Format with labels attribute, if present.
}

\details{
  This is currently only useful in conjuction with
  \code{\link{pretty_breaks}} applied to date/time data,
  because \code{\link{pretty.Date}} returns both the
  position of the breaks and their labels as an attribute.

  If labels are missing, the breaks are formatted with
  \code{\link{format}}.
}
