% File man/standardizePairwise.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{standardizePairwise}
\alias{standardizePairwise}
\alias{standardizeMeansPairwise}
\title{Standardize Pairwise}
\description{Provides standardized effect sizes and their confidence intervals for all unadjusted pairwise comparisons.}

\usage{
\method{standardizePairwise}{data.frame}(frame, mu=0, conf.level=.95, ...)

\method{standardizePairwise}{formula}(formula, mu=0, conf.level=.95, ...)

\method{standardizePairwise}{wsm}(moments, mu=0, conf.level=.95, ...)

\method{standardizePairwise}{bsm}(moments, mu=0, conf.level=.95, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{mu}{a number indicating the true/hypothesized value of the mean difference}
\item{conf.level}{confidence level of the interval}
}

\value{
The returned frame contains the following components:
\item{d}{the standardized mean differences}
\item{SE}{the standard errors of the standardized mean differences}
\item{LL}{the lower limits of the confidence intervals of the standardized mean differences}
\item{UL}{the upper limits of the confidence intervals of the standardized mean differences}
}

\references{
Bonett, D. G. (2008). Confidence intervals for standardized linear contrasts of means. Psychological Methods, 13(2), 99-109.
}