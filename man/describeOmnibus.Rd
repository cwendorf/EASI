% File man/describeOmnibus.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{describeOmnibus}
\title{Describe Omnibus}
\description{Provides a Analysis of Variance source table.}

\usage{
\method{describeOmnibus}{default}(\dots,digits=3)

\method{describeOmnibus}{formula}(formula,digits=3)

\method{describeOmnibus}{wss}(DescStats,digits=3)

\method{describeOmnibus}{bss}(DescStats,digits=3)
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