% File man/estimateMeanSubsets.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateMeanSubsets}
\alias{estimateMeanSubsets}
\alias{estimateMeanSubsets.default}
\alias{estimateMeanSubsets.formula}
\alias{estimateMeanSubsets.wss}
\alias{estimateMeanSubsets.bss}
\title{Estimate Mean Subsets}
\description{Provides the confidence intervals for a mean contrast and the mean subsets that comprise that contrast.}

\usage{
\method{estimateMeanSubsets}{default}(\dots,contrast,conf.level=.95,main=NULL,labels=NULL,digits=3)

\method{estimateMeanSubsets}{formula}(formula,contrast,conf.level=.95,main=NULL,labels=NULL,digits=3)

\method{estimateMeanSubsets}{wss}(DescStats,CorrStats,contrast,conf.level=.95,main=NULL,labels=NULL,digits=3)

\method{estimateMeanSubsets}{bss}(DescStats,contrast,conf.level=.95,main=NULL,labels=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{contrast}{a vector of codes for the contrast among all means}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{labels}{custom labels for the subsets}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains two frames with the following components:    
\item{Est}{the subset means for the variables or groups}
\item{SE}{the standard errors of the subset means for the variables or groups}
\item{df}{the degrees of freedom of the subsets for the variables or groups}
\item{LL}{the lower limit of the confidence interval of the subset means}
\item{UL}{the upper limit of the confidence interval of the subset means}
\item{Est}{the difference between the two subset means}
\item{SE}{the standard error of the difference between the two subset means}
\item{df}{the degrees of the freedom for the difference between the two subset means}
\item{LL}{the lower limit of the confidence interval for the difference between the two subset means}
\item{UL}{the upper limit of the confidence interval for the difference between the two subset means}
}