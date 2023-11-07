% File man/describeBoxes.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeBoxes}
\alias{describeBoxes}
\alias{describeBoxes.default}
\alias{describeBoxes.formula}
\title{Describe Boxes}
\description{Provides a five number summary for a data set.}

\usage{
\method{describeBoxes}{default}(frame, main=NULL, digits=3)

\method{describeBoxes}{formula}(formula, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:
\item{LW}{the lower whisker}
\item{LH}{the lower hinge}
\item{Mdn}{the median value}
\item{UH}{the upper hinge}
\item{UW}{the upper whisker}
}