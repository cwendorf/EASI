% File man/testMeansEffect.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testMeansEffect}
\alias{testMeansEffect}
\alias{testEffect}
\title{Test Means Effect}
\description{Provides a statistical significance test for an Analysis of Variance.}

\usage{
\method{testMeansEffect}{data.frame}(frame, ...)

\method{testMeansEffect}{formula}(formula, ...)

\method{testMeansEffect}{wsm}(moments, corrs, ...)

\method{testMeansEffect}{bsm}(moments, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations for the data set}
}

\value{
The returned frame contains the following components:
\item{F}{the F value for the Effect effect}
\item{dfb}{the degrees of freedom for the Effect effect}
\item{dfw}{the degrees of freedom for the error term}
\item{p}{the p value for the Effect effect}
}