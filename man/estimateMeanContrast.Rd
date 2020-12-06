% File man/estimateMeanContrast.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateMeanContrast}
\alias{estimateMeanContrast}
\alias{estimateMeanContrast.default}
\alias{estimateMeanContrast.formula}
\alias{estimateMeanContrast.wss}
\alias{estimateMeanContrast.bss}
\title{Estimate Mean Contrast}
\description{Provides the mean contrast, standard error, and confidence interval of the contrast.}

\usage{
\method{estimateMeanContrast}{default}(\dots,contrast,conf.level=.95,main=NULL,digits=3)

\method{estimateMeanContrast}{formula}(formula,contrast,conf.level=.95,main=NULL,digits=3)

\method{estimateMeanContrast}{wss}(DescStats,CorrStats,contrast,conf.level=.95,main=NULL,digits=3)

\method{estimateMeanContrast}{bss}(DescStats,contrast,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{contrast}{a vector of codes for the contrast among all means.}
\item{conf.level}{confidence level of the interval.}
\item{main}{a custom title for the table.}
\item{digits}{the specified number of decimal places.}
}