% File man/describeMeansOmnibus.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{describeMeansOmnibus}
\alias{describeMeansOmnibus}
\alias{describeMeansOmnibus.default}
\alias{describeMeansOmnibus.formula}
\alias{describeMeansOmnibus.wss}
\alias{describeMeansOmnibus.bss}
\title{Describe Means Omnibus}
\description{Provides a Analysis of Variance source table.}

\usage{
\method{describeMeansOmnibus}{default}(\dots,main=NULL,digits=3)

\method{describeMeansOmnibus}{formula}(formula,main=NULL,digits=3)

\method{describeMeansOmnibus}{wss}(DescStats,main=NULL,digits=3)

\method{describeMeansOmnibus}{bss}(DescStats,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{SS}{the sum of Squares for the various sources}
\item{df}{the degrees of freedom for the various sources}
\item{MS}{the mean squares for the various sources}
}