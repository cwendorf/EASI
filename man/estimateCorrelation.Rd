% File man/estimateCorrelation.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateCorrelation}
\alias{estimateCorrelation}
\alias{ciCorrelation.default}
\alias{ciCorrelation.wss}
\title{Estimate Correlation}
\description{Provides a correlation, its standard error, and its confidence interval.}

\usage{
\method{estimateCorrelation}{default}(\dots,conf.level=.95,digits=3)

\method{estimateCorrelation}{wss}(CompStats,CorrStats,conf.level=.95,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{CompStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{conf.level}{confidence level of the interval.}
\item{digits}{the specified number of decimal places.}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}