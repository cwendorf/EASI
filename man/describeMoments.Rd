% File man/describeMoments.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeMoments}
\alias{describeMoments}
\title{Describe Moments}
\description{Provides a table of descriptive/summary statistics for a data set.}

\usage{
\method{describeMoments}{default}(variable, ...)

\method{describeMoments}{data.frame}(frame, ...)

\method{describeMoments}{formula}(formula, ...)

\method{describeMoments}{wsm}(moments, ...)

\method{describeMoments}{bsm}(moments, ...)
}

\arguments{
\item{variable}{a numeric vector of data values}
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
}

\value{
The returned frame contains the following components:
\item{N}{the number of individuals for the variables or groups}
\item{M}{the mean for the variables or groups}
\item{SD}{the standard deviation for the variables or groups}
\item{Skew}{an index of skewness for the variables or groups}
\item{Kurt}{an index of kurtosis for the variables or groups}
}