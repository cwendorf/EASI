% File man/plotStandardizedMeanComparison.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotStandardizedMeanComparison}
\alias{plotStandardizedMeanComparison}
\alias{plotStandardizedMeanComparison.default}
\alias{plotStandardizedMeanComparison.formula}
\alias{plotStandardizedMeanComparison.wss}
\alias{plotStandardizedMeanComparison.bss}
\title{Plot StandardizedMean Comparison}
\description{Provides a plot of the confidence intervals for the standardized means and standardized mean difference of a specified comparison.}

\usage{
\method{plotStandardizedMeanComparison}{default}(frame,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeanComparison}{formula}(formula,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeanComparison}{wss}(CompStats,CorrStats,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeanComparison}{bss}(CompStats,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{CompStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{mu}{a number indicating the true/hypothesized value of the means}
\item{conf.level}{confidence level of the interval}
\item{rope}{lower and upper values for a region of practical equivalence}
\item{values}{whether the points should be labeled with their values}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}

\value{
The returned plot contains the following components:
\item{d}{the standardized means}
\item{LL}{the lower limits of the confidence intervals of the standardized means}
\item{UL}{the upper limits of the confidence intervals of the standardized means}
\item{d}{the standardized mean difference}
\item{LL}{the lower limit of the confidence interval of the standardized mean difference}
\item{UL}{the upper limit of the confidence interval of the standardized mean difference}
\item{mu}{a horizontal line for the true/hypothesized value}
\item{rope}{a shaded region of practical equivalence}
}

\references{
Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. Psychological Methods, 13(2), 99-109.
}