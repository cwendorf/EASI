% File man/estimateMeans.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateMeans}
\alias{estimateMeans}
\alias{estimateMeans.default}
\alias{estimateMeans.formula}
\alias{estimateMeans.wss}
\alias{estimateMeans.bss}
\title{Estimate Means}
\description{Provides a table of means, standard deviations, and confidence intervals for each group or level mean.}

\usage{
\method{estimateMeans}{default}(\dots,by,conf.level=.95,main=NULL,digits=3)

\method{estimateMeans}{formula}(formula,by,conf.level=.95,main=NULL,digits=3)

\method{estimateMeans}{wss}(DescStats,by,conf.level=.95,main=NULL,digits=3)

\method{estimateMeans}{bss}(DescStats,by,conf.level=.95,main=NULL,digits=3)
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
\item{M}{the means for the variables or groups}
\item{SE}{the standard errors for the variables or groups}
\item{df}{the degrees of freedom for the variables or groups}
\item{LL}{the lower limits of the confidence intervals of the means}
\item{UL}{the upper limits of the confidence intervals of the means}
}