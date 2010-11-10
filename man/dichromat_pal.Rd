\name{dichromat_pal}
\alias{dichromat_pal}
\title{Dichromat (colour-blind) palette (discrete)...}
\usage{dichromat_pal(name)}

\description{
  Dichromat (colour-blind) palette (discrete)
}
\arguments{
  \item{name}{Name of colour palette.}
}
\examples{dichromat_pal("BluetoOrange.10")(10)
dichromat_pal("BluetoOrange.10")(5)

# Can use with gradient_n to create a continous gradient
cols <- dichromat_pal("DarkRedtoBlue.12")(12)
gradient_n_pal(cols)(seq(0, 1, length = 30))}
