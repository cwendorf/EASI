% File man/plotDifferenceBy.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotDifferenceBy}
\alias{plotDifferenceBy}
\alias{plotDifferenceBy.default}
\alias{plotDifferenceBy.formula}
\alias{plotDifferenceBy.wss}
\alias{plotDifferenceBy.bss}
\title{Plot DifferenceBy}
\description{Provides a plot of the two means, the mean difference, and their confidence intervals, repeated for each level of a second factor in a factorial or mixed design.}

\usage{
\method{plotDifferenceBy}{default}(\dots,by,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{plotDifferenceBy}{formula}(formula,by,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{plotDifferenceBy}{wss}(CompStats,CorrStats,by,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{plotDifferenceBy}{bss}(CompStats,by,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{CompStats}{a matrix/frame of descriptive/summary statistics.}
\item{CorrStats}{a matrix/frame of correlations among the measures.}
\item{by}{a between-subjects factor.}
\item{ylab}{a label for the y-axis.}
\item{xlab}{a label for the x-axis.}
\item{mu}{a number indicating the true/hypothesized value of the mean difference.}
\item{conf.level}{confidence level of the interval.}
\item{rope}{lower and upper values for a region of practical equivalence.}
\item{values}{whether the points should be labeled with their values.}
\item{digits}{the specified number of decimal places.}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.

Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}