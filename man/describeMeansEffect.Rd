% File man/describeMeansEffect.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeMeansEffect}
\alias{describeMeansEffect}
\alias{describeEffect}
\title{Describe Means Effect}
\description{Provides a Analysis of Variance source table.}

\usage{
\method{describeMeansEffect}{data.frame}(frame, ...)

\method{describeMeansEffect}{formula}(formula, ...)

\method{describeMeansEffect}{wsm}(moments, corrs, ...)

\method{describeMeansEffect}{bsm}(moments, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations for the data set}
}

\value{
The returned frame contains the following components:
\item{SS}{the sum of Squares for the various sources}
\item{df}{the degrees of freedom for the various sources}
\item{MS}{the mean squares for the various sources}
}