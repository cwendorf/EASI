% File man/describeCorrelations.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeCorrelations}
\alias{describeCorrelations}
\alias{describeCorrelations.default}
\title{Describe Correlations}
\description{Provides a square matrix/frame of correlations for a data set.}

\usage{
\method{describeCorrelations}{default}(frame, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame of the correlations among the variables.
}