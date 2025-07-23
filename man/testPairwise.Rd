% File man/testPairwise.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testPairwise}
\alias{testPairwise}
\alias{testMeansPairwise}
\title{Test Pairwise}
\description{Provides a statistical significance test for all unadjusted pairwise comparisons.}

\usage{
\method{testPairwise}{data.frame}(frame, mu=0, ...)

\method{testPairwise}{formula}(formula, mu=0, ...)

\method{testPairwise}{wsm}(moments, mu=0, ...)

\method{testPairwise}{bsm}(moments, mu=0, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{mu}{a number indicating the true/hypothesized value of the mean}
}

\value{
The returned frame contains the following components:
\item{Diff}{the differences between the pairs of means}
\item{SE}{the standard error of the differences}
\item{df}{the degrees of the freedom for the differences}
\item{t}{the t values for the differences}
\item{p}{the p values for the differences}
}