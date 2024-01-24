% File man/describeMeansFactorial.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeMeansFactorial}
\alias{describeMeansFactorial}
\alias{describeFactorial}
\title{Describe Means Factorial}
\description{Provides a Analysis of Variance source table for a factorial or mixed design.}

\usage{
\method{describeMeansFactorial}{data.frame}(frame, by, ...)

\method{describeMeansFactorial}{formula}(formula, by, ...)

\method{describeMeansFactorial}{wsm}(moments, corrs, ...)

\method{describeMeansFactorial}{bsm}(moments, by, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{Listmoments}{a list of matrices/frames of descriptive/summary statistics}
\item{Listcorrs}{a list of matrices/frames of correlations for the data set}
\item{by}{a blocking factor}
}

\value{
The returned frame contains the following components:
\item{SS}{the sum of Squares for the various sources}
\item{df}{the degrees of freedom for the various sources}
\item{MS}{the mean squares for the various sources}
}