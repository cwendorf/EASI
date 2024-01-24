% File man/describePercentiles.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describePercentiles}
\alias{describePercentiles}
\title{Describe Percentiles}
\description{Provides a table of percentile statistics for each variable or group.}

\usage{
\method{describePercentiles}{data.frame}(frame, ...)

\method{describePercentiles}{formula}(formula, ...)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
}

\value{
The returned frame contains the following components:
\item{Min}{the minimum values for the variables or groups}
\item{25}{the values of the 25th percentile for the variables or groups}
\item{50}{the values of the 50th percentile for the variables or groups}
\item{75}{the values of the 25th percentile for the variables or groups}
\item{Max}{the maximum values for the variables or groups}
}