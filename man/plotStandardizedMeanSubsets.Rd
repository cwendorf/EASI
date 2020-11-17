% File man/plotStandardizedMeanSubsets.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotStandardizedMeanSubsets}
\alias{plotStandardizedMeanSubsets}
\alias{plotStandardizedMeanSubsets.default}
\alias{plotStandardizedMeanSubsets.formula}
\alias{plotStandardizedMeanSubsets.wss}
\alias{plotStandardizedMeanSubsets.bss}
\title{Plot Standardized Mean Subsets}
\description{Provides the plot of the confidence intervals for a standarized mean contrast and the standardized mean subsets that comprise that contrast.}

\usage{
\method{plotStandardizedMeanSubsets}{default}(\dots,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeanSubsets}{formula}(formula,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeanSubsets}{wss}(DescStats,CorrStats,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeanSubsets}{bss}(DescStats,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{contrast}{a vector of codes for the contrast among all means.}
\item{mu}{a number indicating the true/hypothesized value of the mean contrast.}
\item{conf.level}{confidence level of the interval.}
\item{main}{a custom title for the graph.}
\item{labels}{custom labels for the subsets.}
\item{ylim}{custom limits for the y axis.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}