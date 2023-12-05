% File man/describeMeansFactorial.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeMeansFactorial}
\alias{describeMeansFactorial}
\alias{describeFactorial}
\title{Describe Means Factorial}
\description{Provides a Analysis of Variance source table for a factorial or mixed design.}

\usage{
\method{describeMeansFactorial}{default}(frame, by, main=NULL, digits=3)

\method{describeMeansFactorial}{formula}(formula, by, main=NULL, digits=3)

\method{describeMeansFactorial}{wss}(DescStats, CorrStats, main=NULL, digits=3)

\method{describeMeansFactorial}{bss}(DescStats, by, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{ListDescStats}{a list of matrices/frames of descriptive/summary statistics}
\item{ListCorrStats}{a list of matrices/frames of correlations for the data set}
\item{by}{a blocking factor}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{SS}{the sum of Squares for the various sources}
\item{df}{the degrees of freedom for the various sources}
\item{MS}{the mean squares for the various sources}
}