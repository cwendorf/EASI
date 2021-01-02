% File man/describeMeans.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{describeMeans}
\alias{describeMeans}
\alias{describeMeans.default}
\alias{describeMeans.formula}
\title{Describe Means}
\description{Provides a table of descriptive/summary statistics for a data set.}

\usage{
\method{describeMeans}{default}(\dots,main=NULL,digits=3)

\method{describeMeans}{formula}(formula,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains a single frame with the following components:    
\item{N}{the number of individuals in for the variable or group}
\item{M}{the mean for the variable or group}
\item{SD}{the standard deviation for the variable or group}
}