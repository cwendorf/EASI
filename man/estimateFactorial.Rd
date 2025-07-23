% File man/estimateFactorial.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateFactorial}
\alias{estimateFactorial}
\alias{estimateMeansFactorial}
\title{Estimate Factorial}
\description{Calculates the proportion of variance accounted for and its confidence interval in a factorial or mixed design.}

\usage{
\method{estimateFactorial}{data.frame}(frame, by, conf.level=.95, ...)

\method{estimateFactorial}{formula}(formula, by, conf.level=.95, ...)

\method{estimateFactorial}{wsm}(moments, corrs, conf.level=.95, ...)

\method{estimateFactorial}{bsm}(moments, conf.level=.95, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations for the data set}
\item{by}{a blocking factor}
\item{conf.level}{confidence level of the interval}
}

\value{
The returned frame contains the following components:
\item{Est}{the proportion of variance accounted for}
\item{LL}{the lower limit of the confidence interval for the proportion of variance accounted for}
\item{UL}{the upper limit of the confidence interval for the proportion of variance accounted for}
}