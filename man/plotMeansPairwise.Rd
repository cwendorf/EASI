% File man/plotMeansPairwise.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotMeansPairwise}
\alias{plotMeansPairwise}
\alias{plotMeansPairwise.default}
\alias{plotMeansPairwise.formula}
\alias{plotMeansPairwise.wss}
\alias{plotMeansPairwise.bss}
\title{Plot Means Pairwise}
\description{Provides a plot of all all unadjusted pairwise comparisons and their confidence intervals.}

\usage{
\method{plotMeansPairwise}{default}(\dots,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotMeansPairwise}{formula}(formula,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotMeansPairwise}{wss}(DescStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)

\method{plotMeansPairwise}{bss}(DescStats,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,main=NULL,ylim=NULL,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{ylab}{a label for the y-axis.}
\item{xlab}{a label for the x-axis.}
\item{mu}{a number indicating the true/hypothesized value of the mean.}
\item{conf.level}{confidence level of the interval.}
\item{rope}{lower and upper values for a region of practical equivalence.}
\item{values}{whether the points should be labeled with their values.}
\item{main}{a custom title for the graph.}
\item{ylim}{custom limits for the y axis.}
\item{digits}{the specified number of decimal places.}
}