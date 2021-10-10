% File man/plotMeanComplex.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotMeanComplex}
\alias{plotMeanComplex}
\alias{plotMeanComplex.default}
\alias{plotMeanComplex.formula}
\alias{plotMeanComplex.wss}
\alias{plotMeanComplex.bss}
\title{Plot Mean Complex}
\description{Provides the plot of the confidence intervals for mean contrasts and the difference between those contrasts.}

\usage{
\method{plotMeanComplex}{default}(\dots,contrast,ylab="Mean Contrasts",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)

\method{plotMeanComplex}{formula}(formula,contrast,ylab="Mean Contrasts",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)

\method{plotMeanComplex}{wss}(DescStats,CorrStats,contrast,ylab="Mean Contrasts",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)

\method{plotMeanComplex}{bss}(DescStats,contrast,ylab="Mean Contrasts",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,labels=NULL,ylim=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{contrast1}{a vector of codes for the first contrast among all means}
\item{contrast1}{a vector of codes for the second contrast among all means}
\item{mu}{a number indicating the true/hypothesized value of the mean contrast}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the graph}
\item{labels}{custom labels for the Complex}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
}

\value{
The returned plot contains the following components:
\item{Est}{the contrasts among the variables or groups}
\item{LL}{the lower limit of the confidence intervals of the contrasts}
\item{UL}{the upper limit of the confidence intervals of the contrasts}
\item{mu}{a horizontal line for the true/hypothesized value}
}