% File man/estimateMeansBy.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateMeansBy}
\alias{estimateMeansBy}
\alias{ciMeansBy.default}
\alias{ciMeansBy.formula}
\alias{ciMeansBy.wss}
\alias{ciMeansBy.bss}
\title{Estimate MeansBy}
\description{Provides a table of means, standard deviations, and confidence intervals for each group or level mean, repeated for each level of a second factor in a factorial or mixed design.}

\usage{
\method{estimateMeansBy}{default}(\dots,by,conf.level=.95,digits=3)

\method{estimateMeansBy}{formula}(formula,by,conf.level=.95,digits=3)

\method{estimateMeansBy}{wss}(DescStats,by,conf.level=.95,digits=3)

\method{estimateMeansBy}{bss}(DescStats,by,conf.level=.95,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{by}{a between-subjects factor.}
\item{conf.level}{confidence level of the interval.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}