% File man/estimateMeansRelational.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateMeansRelational}
\alias{estimateMeansRelational}
\alias{estimateMeansRelational.default}
\alias{estimateMeansRelational.formula}
\alias{estimateMeansRelational.wss}
\alias{estimateMeansRelational.bss}
\title{Estimate Means Relational}
\description{Provides a table of arelational (confidence) and relational (comparative) intervals for each group or level mean.}

\usage{
\method{estimateMeansRelational}{default}(\dots,conf.level=.95,main=NULL,digits=3)

\method{estimateMeansRelational}{formula}(formula,conf.level=.95,main=NULL,digits=3)

\method{estimateMeansRelational}{wss}(DescStats,conf.level=.95,main=NULL,digits=3)

\method{estimateMeansRelational}{bss}(DescStats,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{conf.level}{confidence level of the interval.}
\item{main}{a custom title for the table.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}