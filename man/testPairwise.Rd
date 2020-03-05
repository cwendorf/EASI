% File man/testPairwise.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{testPairwise}
\alias{testPairwise}
\alias{nhstPairwise.default}
\alias{nhstPairwise.formula}
\alias{nhstPairwise.wss}
\alias{nhstPairwise.bss}
\title{Test Pairwise}
\description{Provides a statistical significance test for all unadjusted pairwise comparisons given the input.}

\usage{
\method{testPairwise}{default}(\dots,mu=0,digits=3)

\method{testPairwise}{formula}(formula,mu=0,digits=3)

\method{testPairwise}{wss}(DescStats,mu=0,digits=3)

\method{testPairwise}{bss}(DescStats,mu=0,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{mu}{a number indicating the true/hypothesized value of the mean.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}