% File man/testMeanDifference.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{testMeanDifference}
\alias{testMeanDifference}
\alias{testMeanDifference.default}
\alias{testMeanDifference.formula}
\alias{testMeanDifference.wss}
\alias{testMeanDifference.bss}
\title{Test Mean Difference}
\description{Provides a statistical significance test of the mean difference.}

\usage{
\method{testMeanDifference}{default}(\dots,mu=0,main=NULL,digits=3)

\method{testMeanDifference}{formula}(formula,mu=0,main=NULL,digits=3)

\method{testMeanDifference}{wss}(CompStats,CorrStats,mu=0,main=NULL,digits=3)

\method{testMeanDifference}{bss}(CompStats,mu=0,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{CompStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{mu}{a number indicating the true/hypothesized value of the mean difference.}
\item{main}{a custom title for the table.}
\item{digits}{the specified number of decimal places.}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}