% File man/testOmnibus.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{testOmnibus}
\alias{testOmnibus}
\alias{nhstOmnibus.default}
\alias{nhstOmnibus.formula}
\alias{nhstOmnibus.wss}
\alias{nhstOmnibus.bss}
\title{Test Omnibus}
\description{Provides a statistical significance test for for an Analysis of Variance.}

\usage{
\method{testOmnibus}{default}(\dots,digits=3)

\method{testOmnibus}{formula}(formula,digits=3)

\method{testOmnibus}{wss}(DescStats,digits=3)

\method{testOmnibus}{bss}(DescStats,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}