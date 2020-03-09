% File man/estimateDifferenceBy.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateDifferenceBy}
\alias{estimateDifferenceBy}
\alias{ciDifferenceBy.default}
\alias{ciDifferenceBy.formula}
\alias{ciDifferenceBy.wss}
\alias{ciDifferenceBy.bss}
\title{Estimate DifferenceBy}
\description{Provides the mean difference, standard error, and confidence interval of the difference, repeated for each level of a second factor in a factorial or mixed design.}

\usage{
\method{estimateDifferenceBy}{default}(\dots,by,conf.level=.95,digits=3)

\method{estimateDifferenceBy}{formula}(formula,by,conf.level=.95,digits=3)

\method{estimateDifferenceBy}{wss}(CompStats,CorrStats,by,conf.level=.95,digits=3)

\method{estimateDifferenceBy}{bss}(CompStats,by,conf.level=.95,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{CompStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{by}{a between-subjects factor.}
\item{conf.level}{confidence level of the interval.}
\item{digits}{the specified number of decimal places.}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}