% File man/estimateMeansPosthoc.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateMeansPosthoc}
\alias{estimateMeansPosthoc}
\alias{estimateMeansPosthoc.default}
\alias{estimateMeansPosthoc.formula}
\alias{estimateMeansPosthoc.wss}
\alias{estimateMeansPosthoc.bss}
\title{Estimate Means Posthoc}
\description{Provides a table of confidence intervals for all Tukey HSD comparisons.}

\usage{
\method{estimateMeansPosthoc}{default}(\dots,conf.level=.95,main=NULL,digits=3)

\method{estimateMeansPosthoc}{formula}(formula,conf.level=.95,main=NULL,digits=3)

\method{estimateMeansPosthoc}{wss}(DescStats,conf.level=.95,main=NULL,digits=3)

\method{estimateMeansPosthoc}{bss}(DescStats,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{Diff}{the differences between the pairs of means}
\item{SE}{the standard error of the differences}
\item{df}{the degrees of the freedom for the differences}
\item{LL}{the lower limits of the confidence intervals for the differences}
\item{UL}{the upper limits of the confidence intervals for the differences}
}