% File man/standardizeMeans.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{standardizeMeans}
\alias{standardizeMeans}
\alias{smdMeans.default}
\alias{smdMeans.formula}
\alias{smdMeans.wss}
\alias{smdMeans.bss}
\title{Standardize Means}
\description{Provides a standardized effect size and its confidence interval for each group or level mean.}

\usage{
\method{standardizeMeans}{default}(\dots,mu=0,conf.level=.95,digits=3)

\method{standardizeMeans}{formula}(formula,mu=0,conf.level=.95,digits=3)

\method{standardizeMeans}{wss}(DescStats,mu=0,conf.level=.95,digits=3)

\method{standardizeMeans}{bss}(DescStats,mu=0,conf.level=.95,digits=3)
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