% File man/estimateMeans.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateMeans}
\alias{estimateMeans}
\alias{ciMeans.default}
\alias{ciMeans.formula}
\alias{ciMeans.wss}
\alias{ciMeans.bss}
\title{Estimate Means}
\description{Provides a table of means, standard deviations, and confidence intervals for each group or level mean.}

\usage{
\method{estimateMeans}{default}(\dots,by,conf.level=.95,main=NULL,digits=3)

\method{estimateMeans}{formula}(formula,by,conf.level=.95,main=NULL,digits=3)

\method{estimateMeans}{wss}(DescStats,by,conf.level=.95,main=NULL,digits=3)

\method{estimateMeans}{bss}(DescStats,by,conf.level=.95,main=NULL,digits=3)
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