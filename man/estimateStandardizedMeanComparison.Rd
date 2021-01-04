% File man/estimateStandardizedMeanComparison.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateStandardizedMeanComparison}
\alias{estimateStandardizedMeanComparison}
\alias{estimateStandardizedMeanComparison.default}
\alias{estimateStandardizedMeanComparison.formula}
\alias{estimateStandardizedMeanComparison.wss}
\alias{estimateStandardizedMeanComparison.bss}
\title{Estimate Standardized Mean Comparison}
\description{Provides the confidence intervals for the standardized means and standardized mean difference of a specified comparison.}

\usage{
\method{estimateStandardizedMeanComparison}{default}(\dots,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeanComparison}{formula}(formula,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeanComparison}{wss}(CompStats,CorrStats,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeanComparison}{bss}(CompStats,mu=0,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{CompStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{mu}{a number indicating the true/hypothesized value of the means}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}

\value{
The returned list contains two frames with the following components:    
\item{d}{the standardized means}
\item{SE}{the standard errors of the standardized means}
\item{LL}{the lower limits of the confidence intervals of the standardized means}
\item{UL}{the upper limits of the confidence intervals of the standardized means}
\item{d}{the standardized mean difference}
\item{SE}{the standard error of the standardized mean difference}
\item{LL}{the lower limit of the confidence interval of the standardized mean difference}
\item{UL}{the upper limit of the confidence interval of the standardized mean difference}
}