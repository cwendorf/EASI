% File man/estimateStandardizedMeanContrast.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateStandardizedMeanContrast}
\alias{estimateStandardizedMeanContrast}
\alias{estimateStandardizedMeanContrast.default}
\alias{estimateStandardizedMeanContrast.formula}
\alias{estimateStandardizedMeanContrast.wss}
\alias{estimateStandardizedMeanContrast.bss}
\title{Estimate Standardized Mean Contrast}
\description{Provides the standardized effect size and its confidence interval for the contrast.}

\usage{
\method{estimateStandardizedMeanContrast}{default}(\dots,contrast,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeanContrast}{formula}(formula,contrast,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeanContrast}{wss}(DescStats,CorrStats,contrast,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeanContrast}{bss}(DescStats,contrast,mu=0,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations among the measures}
\item{contrast}{a vector of codes for the contrast among all means}
\item{mu}{a number indicating the true/hypothesized value of the mean contrast}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{d}{the standardized mean contrast}
\item{SE}{the standard errors of the standardized mean contrast}
\item{LL}{the lower limit of the confidence interval of the standardized mean contrast}
\item{UL}{the upper limit of the confidence interval of the standardized mean contrast}
}