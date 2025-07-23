% File man/estimatePairwise.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimatePairwise}
\alias{estimatePairwise}
\alias{estimateMeansPairwise}
\title{Estimate Pairwise}
\description{Provides a table of confidence intervals for all unadjusted pairwise comparisons.}

\usage{
\method{estimatePairwise}{data.frame}(frame, conf.level=.95, ...)

\method{estimatePairwise}{formula}(formula, conf.level=.95, ...)

\method{estimatePairwise}{wsm}(moments, conf.level=.95, ...)

\method{estimatePairwise}{bsm}(moments, conf.level=.95, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{conf.level}{confidence level of the interval}
}

\value{
The returned frame contains the following components:
\item{Diff}{the differences between the pairs of means}
\item{SE}{the standard error of the differences}
\item{df}{the degrees of the freedom for the differences}
\item{LL}{the lower limits of the confidence intervals for the differences}
\item{UL}{the upper limits of the confidence intervals for the differences}
}