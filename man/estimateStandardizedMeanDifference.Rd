% File man/estimateStandardizedMeanDifference.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateStandardizedMeanDifference}
\alias{estimateStandardizedMeanDifference}
\alias{estimateStandardizedMeanDifference.default}
\alias{estimateStandardizedMeanDifference.formula}
\alias{estimateStandardizedMeanDifference.wss}
\alias{estimateStandardizedMeanDifference.bss}
\title{Estimate Standardized Mean Difference}
\description{Provides the standardized effect size for the difference and its confidence interval.}

\usage{
\method{estimateStandardizedMeanDifference}{default}(\dots,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeanDifference}{formula}(formula,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeanDifference}{wss}(CompStats,CorrStats,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeanDifference}{bss}(CompStats,mu=0,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{CompStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{mu}{a number indicating the true/hypothesized value of the mean difference}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}

\value{
The returned list contains one frame with the following components:    
\item{d}{the standardized mean difference}
\item{SE}{the standard error of the standardized mean difference}
\item{LL}{the lower limit of the confidence interval of the standardized mean difference}
\item{UL}{the upper limit of the confidence interval of the standardized mean difference}
}