% File man/combine.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{combine}
\alias{combine}
\title{Combine}
\description{Combine multiple frames of summary statistics into a list.}

\usage{
\method{construct}{default}(..., class="NULL")
}

\arguments{
\item{...}{a set of vectors to combine into a list}
\item{class}{specified class of the list}
}

\value{
The returned list should include multiple frames of the same type (bsm, wsm or cor).
}