% File man/estimateCorrelations.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateCorrelations}
\alias{estimateCorrelations}
\title{Estimate Correlations}
\description{Provides correlations, their standard errors, and their confidence intervals for a list of variables.}

\usage{
\method{estimateCorrelations}{default}(frame, conf.level=.95, main=NULL, digits=3)

\method{estimateCorrelations}{wss}(CompStats, CorrStats, conf.level=.95, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{CompStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{conf.level}{confidence level of the interval}
\item{line}{a number for a horizontal reference line}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{R}{the correlations for the variables}
\item{SE}{the standard errors of the correlations}
\item{LL}{the lower limit of the confidence interval for the correlations}
\item{UL}{the upper limit of the confidence interval for the correlations}
}