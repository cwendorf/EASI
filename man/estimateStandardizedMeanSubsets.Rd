% File man/estimateStandardizedMeanSubsets.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateStandardizedMeanSubsets}
\alias{estimateStandardizedMeanSubsets}
\alias{estimateStandardizedMeanSubsets.default}
\alias{estimateStandardizedMeanSubsets.formula}
\alias{estimateStandardizedMeanSubsets.wss}
\alias{estimateStandardizedMeanSubsets.bss}
\title{Estimate Standardized Mean Subsets}
\description{Provides the confidence intervals for a standarized mean contrast and the standardized mean subsets that comprise that contrast.}

\usage{
\method{estimateStandardizedMeanSubsets}{default}(\dots,contrast,mu=0,conf.level=.95,main=NULL,labels=NULL,digits=3)

\method{estimateStandardizedMeanSubsets}{formula}(formula,contrast,mu=0,conf.level=.95,main=NULL,labels=NULL,digits=3)

\method{estimateStandardizedMeanSubsets}{wss}(DescStats,CorrStats,mu=0,contrast,conf.level=.95,main=NULL,labels=NULL,digits=3)

\method{estimateStandardizedMeanSubsets}{bss}(DescStats,contrast,mu=0,conf.level=.95,main=NULL,labels=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{contrast}{a vector of codes for the contrast among all means.}
\item{mu}{a number indicating the true/hypothesized value of the mean subsets.}
\item{conf.level}{confidence level of the interval.}
\item{main}{a custom title for the table.}
\item{labels}{custom labels for the subsets.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}