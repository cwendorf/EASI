% File man/estimateMeans.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateMeans}
\alias{estimateMeans}
\alias{estimateMeansSet}
\title{Estimate Means}
\description{Provides a table of means, standard deviations, and confidence intervals for each group or level mean.}

\usage{
\method{estimateMeans}{default}(variable, conf.level=.95, ...)

\method{estimateMeans}{data.frame}(frame, conf.level=.95, ...)

\method{estimateMeans}{formula}(formula, conf.level=.95, ...)

\method{estimateMeans}{wsm}(moments, conf.level=.95, ...)

\method{estimateMeans}{bsm}(moments, conf.level=.95, ...)
}

\arguments{
\item{variable}{a numeric vector of data values}
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{conf.level}{confidence level of the interval}
}

\value{
The returned frame contains the following components:
\item{M}{the means for the variables or groups}
\item{SE}{the standard errors for the variables or groups}
\item{df}{the degrees of freedom for the variables or groups}
\item{LL}{the lower limits of the confidence intervals of the means}
\item{UL}{the upper limits of the confidence intervals of the means}
}