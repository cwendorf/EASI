% File man/testMeansOmnibus.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{testMeansOmnibus}
\alias{testMeansOmnibus}
\alias{testMeansOmnibus.default}
\alias{testMeansOmnibus.formula}
\alias{testMeansOmnibus.wss}
\alias{testMeansOmnibus.bss}
\title{Test Means Omnibus}
\description{Provides a statistical significance test for for an Analysis of Variance.}

\usage{
\method{testMeansOmnibus}{default}(\dots,main=NULL,digits=3)

\method{testMeansOmnibus}{formula}(formula,main=NULL,digits=3)

\method{testMeansOmnibus}{wss}(DescStats,main=NULL,digits=3)

\method{testMeansOmnibus}{bss}(DescStats,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{main}{a custom title for the table.}
\item{digits}{the specified number of decimal places.}
}