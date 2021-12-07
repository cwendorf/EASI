% File man/estimateStandardizedMeansPosthoc.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateStandardizedMeansPosthoc}
\alias{estimateStandardizedMeansPosthoc}
\alias{estimateStandardizedMeansPosthoc.default}
\alias{estimateStandardizedMeansPosthoc.formula}
\alias{estimateStandardizedMeansPosthoc.wss}
\alias{estimateStandardizedMeansPosthoc.bss}
\title{Estimate Standardized Means Posthoc}
\description{Provides standardized effect sizes and their confidence intervals for all Tukey HSD comparisons.}

\usage{
\method{estimateStandardizedMeansPosthoc}{default}(\dots,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeansPosthoc}{formula}(formula,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeansPosthoc}{wss}(DescStats,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeansPosthoc}{bss}(DescStats,mu=0,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{mu}{a number indicating the true/hypothesized value of the mean difference}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{d}{the standardized mean differences}
\item{SE}{the standard errors of the standardized mean differences}
\item{LL}{the lower limits of the confidence intervals of the standardized mean differences}
\item{UL}{the upper limits of the confidence intervals of the standardized mean differences}
}