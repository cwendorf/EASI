% File man/describeMeans.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{describeMeans}
\alias{describeMeans}
\alias{descMeans.default}
\alias{descMeans.formula}
\title{Describe Means}
\description{Provides a table of descriptive/summary statistics for a data set.}

\usage{
\method{describeMeans}{default}(\dots,digits=3)

\method{describeMeans}{formula}(formula,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}