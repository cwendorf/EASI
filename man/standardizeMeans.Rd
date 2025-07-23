% File man/standardizeMeans.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{standardizeMeans}
\alias{standardizeMeans}
\alias{standardizeMeansSet}
\title{Standardize Means}
\description{Provides a standardized effect size and its confidence interval for each group or level mean.}

\usage{
\method{standardizeMeans}{default}(variable, mu=0, conf.level=.95, ...)

\method{standardizeMeans}{data.frame}(frame, mu=0, conf.level=.95, ...)

\method{standardizeMeans}{formula}(formula, mu=0, conf.level=.95, ...)

\method{standardizeMeans}{wsm}(moments, mu=0, conf.level=.95, ...)

\method{standardizeMeans}{bsm}(moments, mu=0, conf.level=.95, ...)
}

\arguments{
\item{variable}{a numeric vector of data values}
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{mu}{a number indicating the true/hypothesized value of the mean}
\item{conf.level}{confidence level of the interval}
}

\value{
The returned frame contains the following components:
\item{d}{the standardized means}
\item{SE}{the standard errors of the standardized means}
\item{LL}{the lower limits of the confidence intervals of the standardized means}
\item{UL}{the upper limits of the confidence intervals of the standardized means}
}

\references{
Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. Psychological Methods, 13(2), 99-109.
}