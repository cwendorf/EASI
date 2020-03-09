% File man/standardizeMeansBy.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{standardizeMeansBy}
\alias{standardizeMeansBy}
\alias{smdMeansBy.default}
\alias{smdMeansBy.formula}
\alias{smdMeansBy.wss}
\alias{smdMeansBy.bss}
\title{Standardize MeansBy}
\description{Provides a standardized effect size and its confidence interval for each group or level mean, repeated for each level of a second factor in a factorial or mixed design.}

\usage{
\method{standardizeMeansBy}{default}(\dots,by,mu=0,conf.level=.95,digits=3)

\method{standardizeMeansBy}{formula}(formula,by,mu=0,conf.level=.95,digits=3)

\method{standardizeMeansBy}{wss}(DescStats,by,mu=0,conf.level=.95,digits=3)

\method{standardizeMeansBy}{bss}(DescStats,by,mu=0,conf.level=.95,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{by}{a between-subjects factor.}
\item{mu}{a number indicating the true/hypothesized value of the mean.}
\item{conf.level}{confidence level of the interval.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}