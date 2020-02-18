% File man/describeData.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{describeData}
\alias{describeData}
\alias{descData.default}
\alias{descData.formula}
\title{Describe Data}
\description{Provides a table of descriptive/summary statistics for a data set.}

\usage{
# describeData is a wrapper function. It will automatically call the appropriate method below given the class of the object.
describeData(\dots,digits=3)

\method{descData}{default}(\dots)

\method{descData}{formula}(formula)
}

\arguments{
  \item{\dots}{a set of (non-empty) numeric vectors of data values.}
  \item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
  \item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}