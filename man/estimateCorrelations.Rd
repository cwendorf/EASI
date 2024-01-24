% File man/estimateCorrelations.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateCorrelations}
\alias{estimateCorrelations}
\title{Estimate Correlations}
\description{Provides correlations, their standard errors, and their confidence intervals for a list of variables.}

\usage{
\method{estimateCorrelations}{data.frame}(frame, conf.level=.95, ...)

\method{estimateCorrelations}{wsm}(moments, corrs, conf.level=.95, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
\item{conf.level}{confidence level of the interval}
\item{line}{a number for a horizontal reference line}
}

\value{
The returned frame contains the following components:
\item{R}{the correlations for the variables}
\item{SE}{the standard errors of the correlations}
\item{LL}{the lower limit of the confidence interval for the correlations}
\item{UL}{the upper limit of the confidence interval for the correlations}
}