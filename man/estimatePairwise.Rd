% File man/estimatePairwise.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimatePairwise}
\alias{estimatePairwise}
\alias{ciPairwise.default}
\alias{ciPairwise.formula}
\alias{ciPairwise.wss}
\alias{ciPairwise.bss}
\title{Estimate Pairwise}
\description{Provides a table of confidence intervals for all unadjusted pairwise comparisons among the means.}

\usage{
\method{estimatePairwise}{default}(\dots,conf.level=.95,main=NULL,digits=3)

\method{estimatePairwise}{formula}(formula,conf.level=.95,main=NULL,digits=3)

\method{estimatePairwise}{wss}(DescStats,conf.level=.95,main=NULL,digits=3)

\method{estimatePairwise}{bss}(DescStats,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{conf.level}{confidence level of the interval.}
\item{main}{a custom title for the table.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}