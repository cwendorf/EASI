% File man/plotStandardizedMeansPairwise.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotStandardizedMeansPairwise}
\alias{plotStandardizedMeansPairwise}
\alias{plotStandardizedMeansPairwise.default}
\alias{plotStandardizedMeansPairwise.formula}
\alias{plotStandardizedMeansPairwise.wss}
\alias{plotStandardizedMeansPairwise.bss}
\title{Plot Standardized Means Pairwise}
\description{Provides a plot of the standardized effect sizes and their confidence intervals for all unadjusted pairwise comparisons.}

\usage{
\method{plotStandardizedMeansPairwise}{default}(\dots,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeansPairwise}{formula}(formula,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeansPairwise}{wss}(DescStats,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotStandardizedMeansPairwise}{bss}(DescStats,ylab="Standardized Mean Difference",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{mu}{a number indicating the true/hypothesized value of the mean difference}
\item{conf.level}{confidence level of the interval}
\item{rope}{lower and upper values for a region of practical equivalence}
\item{values}{whether the points should be labeled with their values}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
}

\value{
The returned plot contains the following components:
\item{d}{the standardized mean differences}
\item{LL}{the lower limits of the confidence intervals of the standardized mean differences}
\item{UL}{the upper limits of the confidence intervals of the standardized mean differences}
\item{mu}{a horizontal line for the true/hypothesized value}
\item{rope}{a shaded region of practical equivalence}
}