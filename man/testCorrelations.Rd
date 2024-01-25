% File man/testCorrelations.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testCorrelations}
\alias{testCorrelations}
\title{Test Correlations}
\description{Provides a statistical significance test for correlations of the specified variables.}

\usage{
\method{testCorrelations}{data.frame}(frame, ...)

\method{testCorrelations}{wsm}(moments, corrs, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
}

\value{
The returned frame contains the following components:
\item{R}{the correlations among the variables}
\item{SE}{the standard error of the correlations}
\item{df}{the degrees of the freedom for the correlations}
\item{t}{the t values for the correlations}
\item{p}{the p values for the correlations}
}