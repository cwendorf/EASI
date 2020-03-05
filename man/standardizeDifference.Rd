% File man/standardizeDifference.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{standardizeDifference}
\alias{standardizeDifference}
\alias{smdDifference.default}
\alias{smdDifference.formula}
\alias{smdDifference.wss}
\alias{smdDifference.bss}
\title{Standardize Difference}
\description{Provides the standardized effect size for the difference and its confidence interval.}

\usage{
\method{standardizeDifference}{default}(\dots,mu=0,conf.level=.95,digits=3)

\method{standardizeDifference}{formula}(formula,mu=0,conf.level=.95,digits=3)

\method{standardizeDifference}{wss}(CompStats,CorrStats,mu=0,conf.level=.95,digits=3)

\method{standardizeDifference}{bss}(CompStats,mu=0,conf.level=.95,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{CompStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{mu}{a number indicating the true/hypothesized value of the mean difference.}
\item{conf.level}{confidence level of the interval.}
\item{digits}{the specified number of decimal places.}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}