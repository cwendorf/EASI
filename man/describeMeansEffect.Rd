% File man/describeMeansEffect.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeMeansEffect}
\alias{describeMeansEffect}
\alias{describeEffect}
\title{Describe Means Effect}
\description{Provides a Analysis of Variance source table.}

\usage{
\method{describeMeansEffect}{default}(frame, main=NULL, digits=3)

\method{describeMeansEffect}{formula}(formula, main=NULL, digits=3)

\method{describeMeansEffect}{wss}(DescStats, CorrStats, main=NULL, digits=3)

\method{describeMeansEffect}{bss}(DescStats, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations for the data set}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{SS}{the sum of Squares for the various sources}
\item{df}{the degrees of freedom for the various sources}
\item{MS}{the mean squares for the various sources}
}