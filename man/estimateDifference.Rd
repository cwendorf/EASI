% File man/estimateDifference.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateDifference}
\alias{estimateDifference}
\alias{ciDifference.default}
\alias{ciDifference.formula}
\alias{ciDifference.wss}
\alias{ciDifference.bss}
\title{Estimate Difference}
\description{Provides the mean difference, standard error, and confidence interval of the difference.}

\usage{
\method{estimateDifference}{default}(\dots,conf.level=.95,main=NULL,digits=3)

\method{estimateDifference}{formula}(formula,conf.level=.95,main=NULL,digits=3)

\method{estimateDifference}{wss}(CompStats,CorrStats,conf.level=.95,main=NULL,digits=3)

\method{estimateDifference}{bss}(CompStats,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{CompStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{conf.level}{confidence level of the interval.}
\item{main}{a custom title for the table.}
\item{digits}{the specified number of decimal places.}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}