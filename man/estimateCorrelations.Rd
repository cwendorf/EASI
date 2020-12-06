% File man/estimateCorrelations.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateCorrelations}
\alias{estimateCorrelations}
\alias{estimateCorrelations.default}
\alias{estimateCorrelations.wss}
\title{Estimate Correlations}
\description{Provides correlations, their standard errors, and their confidence intervals for a list of variables.}

\usage{
\method{estimateCorrelations}{default}(\dots,conf.level=.95,main=NULL,digits=3)

\method{estimateCorrelations}{wss}(CompStats,CorrStats,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{CompStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{conf.level}{confidence level of the interval.}
\item{main}{a custom title for the table.}
\item{digits}{the specified number of decimal places.}
}