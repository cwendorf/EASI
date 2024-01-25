% File man/describeCorrelations.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeCorrelations}
\alias{describeCorrelations}
\title{Describe Correlations}
\description{Provides a square matrix/frame of correlations for a data set.}

\usage{
\method{describeCorrelations}{data.frame}(frame, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
}

\value{
The returned frame contains the correlations among the variables.
}