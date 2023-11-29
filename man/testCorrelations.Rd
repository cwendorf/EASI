% File man/testCorrelations.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testCorrelations}
\title{Test Correlations}
\description{Provides a statistical significance test for correlations of the specified variables.}

\usage{
\method{testCorrelations}{default}(frame, main=NULL, digits=3)

\method{testCorrelations}{wss}(CompStats, CorrStats, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{CompStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{R}{the correlations among the variables}
\item{SE}{the standard error of the correlations}
\item{df}{the degrees of the freedom for the correlations}
\item{t}{the t values for the correlations}
\item{p}{the p values for the correlations}
}