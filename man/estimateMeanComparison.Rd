% File man/estimateMeanComparison.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateMeanComparison}
\alias{estimateMeanComparison}
\alias{estimateMeanComparison.default}
\alias{estimateMeanComparison.formula}
\alias{estimateMeanComparison.wss}
\alias{estimateMeanComparison.bss}
\title{Estimate Mean Comparison}
\description{Provides the confidence intervals for the means and mean difference of a specified comparison.}

\usage{
\method{estimateMeanComparison}{default}(\dots,conf.level=.95,main=NULL,digits=3)

\method{estimateMeanComparison}{formula}(formula,conf.level=.95,main=NULL,digits=3)

\method{estimateMeanComparison}{wss}(CompStats,CorrStats,conf.level=.95,main=NULL,digits=3)

\method{estimateMeanComparison}{bss}(CompStats,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{CompStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}

\value{
The returned list contains two frames with the following components:    
\item{M}{the means for the variables or groups}
\item{SE}{the standard Errors for the variables or groups}
\item{df}{the degrees of freedom for the variables or groups}
\item{LL}{the lower limit of the confidence interval of the means}
\item{UL}{the upper limit of the confidence interval of the means}
\item{Diff}{the difference between the two means}
\item{SE}{the standard error of the difference}
\item{df}{the degrees of the freedom for the difference}
\item{LL}{the lower limit of the confidence interval for the difference}
\item{UL}{the upper limit of the confidence interval for the difference}
}