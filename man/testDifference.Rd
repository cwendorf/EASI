% File man/testDifference.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{testDifference}
\alias{testDifference}
\alias{nhstDifference.default}
\alias{nhstDifference.formula}
\alias{nhstDifference.wss}
\alias{nhstDifference.bss}
\title{Test Difference}
\description{Provides a statistical significance test of the mean difference.}

\usage{
\method{testDifference}{default}(\dots,mu=0,digits=3)

\method{testDifference}{formula}(formula,mu=0,digits=3)

\method{testDifference}{wss}(CompStats,CorrStats,mu=0,digits=3)

\method{testDifference}{bss}(CompStats,mu=0,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{CompStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{mu}{a number indicating the true/hypothesized value of the mean difference.}
\item{digits}{the specified number of decimal places.}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}