% File man/estimatePosthoc.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimatePosthoc}
\alias{estimatePosthoc}
\alias{estimateMeansPosthoc}
\title{Estimate Posthoc}
\description{Provides a table of confidence intervals for all Tukey HSD comparisons.}

\usage{
\method{estimatePosthoc}{default}(frame, conf.level=.95, main=NULL, digits=3)

\method{estimatePosthoc}{formula}(formula, conf.level=.95, main=NULL, digits=3)

\method{estimatePosthoc}{wss}(DescStats, conf.level=.95, main=NULL, digits=3)

\method{estimatePosthoc}{bss}(DescStats, conf.level=.95, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned frame contains the following components:    
\item{Diff}{the differences between the pairs of means}
\item{SE}{the standard error of the differences}
\item{df}{the degrees of the freedom for the differences}
\item{LL}{the lower limits of the confidence intervals for the differences}
\item{UL}{the upper limits of the confidence intervals for the differences}
}