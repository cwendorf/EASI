% File man/estimateMeansOmnibus.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateMeansOmnibus}
\alias{estimateMeansOmnibus}
\alias{estimateMeansOmnibus.default}
\alias{estimateMeansOmnibus.formula}
\alias{estimateMeansOmnibus.wss}
\alias{estimateMeansOmnibus.bss}
\title{Estimate Means Omnibus}
\description{Calculates the proportion of variance accounted for and its confidence interval.}

\usage{
\method{estimateMeansOmnibus}{default}(frame,conf.level=.95,main=NULL,digits=3)

\method{estimateMeansOmnibus}{formula}(formula,conf.level=.95,main=NULL,digits=3)

\method{estimateMeansOmnibus}{wss}(DescStats,CorrStats,conf.level=.95,main=NULL,digits=3)

\method{estimateMeansOmnibus}{bss}(DescStats,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations for the data set}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{Est}{the proportion of variance accounted for}
\item{LL}{the lower limit of the confidence interval for the proportion of variance accounted for}
\item{UL}{the upper limit of the confidence interval for the proportion of variance accounted for}
}