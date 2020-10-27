% File man/describeOmnibus.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{describeOmnibus}
\alias{describeOmnibus}
\alias{describeOmnibus.default}
\alias{describeOmnibus.formula}
\alias{describeOmnibus.wss}
\alias{describeOmnibus.bss}
\title{Describe Omnibus}
\description{Provides a Analysis of Variance source table.}

\usage{
\method{describeOmnibus}{default}(\dots,main=NULL,digits=3)

\method{describeOmnibus}{formula}(formula,main=NULL,digits=3)

\method{describeOmnibus}{wss}(DescStats,main=NULL,digits=3)

\method{describeOmnibus}{bss}(DescStats,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{main}{a custom title for the table.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}