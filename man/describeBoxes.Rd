% File man/describeBoxes.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{describeBoxes}
\alias{describeBoxes}
\alias{describeBoxes.default}
\alias{describeBoxes.formula}
\title{Describe Boxes}
\description{Provides a five number summary (median and quartile information) for a data set.}

\usage{
\method{describeBoxes}{default}(\dots,main=NULL,digits=3)

\method{describeBoxes}{formula}(formula,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{main}{a custom title for the table.}
\item{digits}{the specified number of decimal places.}
}