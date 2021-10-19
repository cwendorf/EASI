% File man/plotStandardizedMeans.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotStandardizedMeans}
\alias{plotStandardizedMeans}
\alias{plotStandardizedMeans.default}
\alias{plotStandardizedMeans.formula}
\alias{plotStandardizedMeans.wss}
\alias{plotStandardizedMeans.bss}
\title{Plot Standardized Means}
\description{Provides a plot of the standardized effect size and its confidence interval for each group or level mean.}

\usage{
\method{plotStandardizedMeans}{default}(\dots,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeans}{formula}(formula,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeans}{wss}(DescStats,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeans}{bss}(DescStats,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{mu}{a number indicating the true/hypothesized value of the mean}
\item{conf.level}{confidence level of the interval}
\item{line}{a number for a horizontal reference line}
\item{rope}{lower and upper values for a region of practical equivalence}
\item{values}{whether the points should be labeled with their values}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
}

\value{
The returned plot contains the following components:
\item{d}{the standardized means}
\item{LL}{the lower limits of the confidence intervals of the standardized means}
\item{UL}{the upper limits of the confidence intervals of the standardized means}
\item{mu}{a horizontal line for the true/hypothesized value}
\item{rope}{a shaded region of practical equivalence}
}

\references{
Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. Psychological Methods, 13(2), 99-109.
}