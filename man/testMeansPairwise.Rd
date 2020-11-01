% File man/testMeansPairwise.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{testMeansPairwise}
\alias{testMeansPairwise}
\alias{testMeansPairwise.default}
\alias{testMeansPairwise.formula}
\alias{testMeansPairwise.wss}
\alias{testMeansPairwise.bss}
\title{Test Means Pairwise}
\description{Provides a statistical significance test for all unadjusted pairwise comparisons.}

\usage{
\method{testMeansPairwise}{default}(\dots,mu=0,main=NULL,digits=3)

\method{testMeansPairwise}{formula}(formula,mu=0,main=NULL,digits=3)

\method{testMeansPairwise}{wss}(DescStats,mu=0,main=NULL,digits=3)

\method{testMeansPairwise}{bss}(DescStats,mu=0,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{mu}{a number indicating the true/hypothesized value of the mean.}
\item{main}{a custom title for the table.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}