% File man/estimateMeanComplex.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateMeanComplex}
\alias{estimateMeanComplex}
\alias{estimateMeanComplex.default}
\alias{estimateMeanComplex.formula}
\alias{estimateMeanComplex.wss}
\alias{estimateMeanComplex.bss}
\title{Estimate Mean Complex}
\description{Provides the confidence intervals for mean contrasts and the difference between those contrasts.}

\usage{
\method{estimateMeanComplex}{default}(\dots,contrast1,contrast2,conf.level=.95,main=NULL,labels=NULL,digits=3)

\method{estimateMeanComplex}{formula}(formula,contrast1,contrast2,conf.level=.95,main=NULL,labels=NULL,digits=3)

\method{estimateMeanComplex}{wss}(DescStats,CorrStats,contrast1,contrast2,conf.level=.95,main=NULL,labels=NULL,digits=3)

\method{estimateMeanComplex}{bss}(DescStats,contrast1,contrast2,conf.level=.95,main=NULL,labels=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{contrast1}{a vector of codes for the first contrast among all means}
\item{contrast2}{a vector of codes for the second contrast among all means}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{labels}{custom labels for the contrasts}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains two frames with the following components:    
\item{Est}{the contrasts for the variables or groups}
\item{SE}{the standard errors of the contrasts for the variables or groups}
\item{df}{the degrees of freedom for the contrasts of the variables or groups}
\item{LL}{the lower limit of the confidence intervals of the contrasts}
\item{UL}{the upper limit of the confidence intervals of the contrasts}
\item{Est}{the difference between the two contrasts}
\item{SE}{the standard error of the difference between the two contrasts}
\item{df}{the degrees of the freedom for the difference between the two contrasts}
\item{LL}{the lower limit of the confidence interval for the difference between the two contrasts}
\item{UL}{the upper limit of the confidence interval for the difference between the two contrasts}
}