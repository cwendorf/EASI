% File man/retain.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{retain}
\alias{retain}
\title{Retain}
\description{Retain a frame following other calculations.}

\usage{
\method{retain}{default}(x, name)
}

\arguments{
\item{x}{the frame to be retained}
\item{name}{the name for the frame}
}

\value{
The function retains (assigns) the previously calculated frame from previous calculations.
}