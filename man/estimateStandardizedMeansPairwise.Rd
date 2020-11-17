% File man/estimateStandardizedMeansPairwise.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateStandardizedMeansPairwise}
\alias{estimateStandardizedMeansPairwise}
\alias{estimateStandardizedMeansPairwise.default}
\alias{estimateStandardizedMeansPairwise.formula}
\alias{estimateStandardizedMeansPairwise.wss}
\alias{estimateStandardizedMeansPairwise.bss}
\title{Estimate Standardized Means Pairwise}
\description{Provides standardized effect sizes and their confidence interval for all unadjusted pairwise comparisons.}

\usage{
\method{estimateStandardizedMeansPairwise}{default}(\dots,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeansPairwise}{formula}(formula,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeansPairwise}{wss}(DescStats,mu=0,conf.level=.95,main=NULL,digits=3)

\method{estimateStandardizedMeansPairwise}{bss}(DescStats,mu=0,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{mu}{a number indicating the true/hypothesized value of the mean difference.}
\item{conf.level}{confidence level of the interval.}
\item{main}{a custom title for the table.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}