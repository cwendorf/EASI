% File man/standardizePairwise.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{standardizePairwise}
\alias{standardizePairwise}
\alias{smdPairwise.default}
\alias{smdPairwise.formula}
\alias{smdPairwise.wss}
\alias{smdPairwise.bss}
\title{Standardize Pairwise}
\description{Provides a standardized effect size and its confidence interval for all unadjusted pairwise comparisons.}

\usage{
\method{standardizePairwise}{default}(\dots,mu=0,conf.level=.95,digits=3)

\method{standardizePairwise}{formula}(formula,mu=0,conf.level=.95,digits=3)

\method{standardizePairwise}{wss}(DescStats,mu=0,conf.level=.95,digits=3)

\method{standardizePairwise}{bss}(DescStats,mu=0,conf.level=.95,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{mu}{a number indicating the true/hypothesized value of the mean.}
\item{conf.level}{confidence level of the interval.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}