% File man/estimateStandardizedMeans.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateStandardizedMeans}
\alias{estimateStandardizedMeans}
\alias{standardizeMeans}
\title{Estimate Standardized Means}
\description{Provides a standardized effect size and its confidence interval for each group or level mean.}

\usage{
\method{estimateStandardizedMeans}{default}(frame, mu=0, conf.level=.95, main=NULL, digits=3)

\method{estimateStandardizedMeans}{formula}(formula, mu=0, conf.level=.95, main=NULL, digits=3)

\method{estimateStandardizedMeans}{wss}(DescStats, mu=0, conf.level=.95, main=NULL, digits=3)

\method{estimateStandardizedMeans}{bss}(DescStats, mu=0, conf.level=.95, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{mu}{a number indicating the true/hypothesized value of the mean}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{d}{the standardized means}
\item{SE}{the standard errors of the standardized means}
\item{LL}{the lower limits of the confidence intervals of the standardized means}
\item{UL}{the upper limits of the confidence intervals of the standardized means}
}

\references{
Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. Psychological Methods, 13(2), 99-109.
}