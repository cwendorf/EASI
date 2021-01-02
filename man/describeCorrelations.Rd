% File man/describeCorrelations.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{describeCorrelations}
\alias{describeCorrelations}
\alias{describeCorrelations.default}
\title{Describe Correlations}
\description{Provides a square matrix/frame of correlations for a data set.}

\usage{
\method{describeCorrelations}{default}(\dots,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{main}{a custom title for the table.}
\item{digits}{the specified number of decimal places.}
}

\value{
The returned list contains a single frame of the correlations among the variables.
}