% File man/plotStandardizedMeanContrast.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotStandardizedMeanContrast}
\alias{plotStandardizedMeanContrast}
\alias{plotStandardizedMeanContrast.default}
\alias{plotStandardizedMeanContrast.formula}
\alias{plotStandardizedMeanContrast.wss}
\alias{plotStandardizedMeanContrast.bss}
\title{Plot Standardized Mean Contrast}
\description{Provides the plot of the standardized effect size and its confidence interval for the contrast.}

\usage{
\method{plotStandardizedMeanContrast}{default}(\dots,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeanContrast}{formula}(formula,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeanContrast}{wss}(DescStats,CorrStats,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeanContrast}{bss}(DescStats,contrast,ylab="Standardized Mean Contrast",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{contrast}{a vector of codes for the contrast among all means}
\item{mu}{a number indicating the true/hypothesized value of the mean contrast}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
}

\value{
The returned plot contains the following components:
\item{d}{the standardized mean contrast}
\item{LL}{the lower limit of the confidence interval of the standardized mean contrast}
\item{UL}{the upper limit of the confidence interval of the standardized mean contrast}
\item{mu}{a horizontal line for the true/hypothesized value}
}

\references{
Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. Psychological Methods, 13(2), 99-109.
}