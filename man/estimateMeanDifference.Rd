% File man/estimateMeanDifference.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateMeanDifference}
\alias{estimateMeanDifference}
\alias{estimateMeanDifference.default}
\alias{estimateMeanDifference.formula}
\alias{estimateMeanDifference.wss}
\alias{estimateMeanDifference.bss}
\title{Estimate Mean Difference}
\description{Provides the mean difference, standard error, and confidence interval of the difference.}

\usage{
\method{estimateMeanDifference}{default}(\dots,conf.level=.95,main=NULL,digits=3)

\method{estimateMeanDifference}{formula}(formula,conf.level=.95,main=NULL,digits=3)

\method{estimateMeanDifference}{wss}(CompStats,CorrStats,conf.level=.95,main=NULL,digits=3)

\method{estimateMeanDifference}{bss}(CompStats,conf.level=.95,main=NULL,digits=3)
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
}