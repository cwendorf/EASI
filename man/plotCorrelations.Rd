% File man/plotCorrelations.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotCorrelations}
\alias{plotCorrelations}
\alias{plotCorrelations.default}
\alias{plotCorrelations.wss}
\title{Plot Correlations}
\description{Provides a plot of all correlations and their confidence intervals for a list of variables.}

\usage{
\method{plotCorrelations}{default}(\dots,,ylab="Correlation",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{plotCorrelations}{wss}(CompStats,CorrStats,ylab="Correlation",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{CompStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{ylab}{a label for the y-axis.}
\item{xlab}{a label for the x-axis.}
\item{mu}{a number indicating the true/hypothesized value of the correlation.}
\item{conf.level}{confidence level of the interval.}
\item{rope}{lower and upper values for a region of practical equivalence.}
\item{values}{whether the points should be labeled with their values.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}