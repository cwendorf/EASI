% File man/plotMeansBy.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotMeansBy}
\alias{plotMeansBy}
\alias{plotMeansBy.default}
\alias{plotMeansBy.formula}
\alias{plotMeansBy.wss}
\alias{plotMeansBy.bss}
\title{Plot MeansBy}
\description{Provides a plot of all group or level means and their confidence intervals, repeated for each level of a second factor in a factorial or mixed design.}

\usage{
\method{plotMeansBy}{default}(\dots,by,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{plotMeansBy}{formula}(formula,by,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{plotMeansBy}{wss}(DescStats,by,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)

\method{plotMeansBy}{bss}(DescStats,by,ylab="Outcome",xlab="",mu=0,conf.level=.95,rope=NULL,values=TRUE,digits=3)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{by}{a between-subjects factor.}
\item{ylab}{a label for the y-axis.}
\item{xlab}{a label for the x-axis.}
\item{mu}{a number indicating the true/hypothesized value of the mean.}
\item{conf.level}{confidence level of the interval.}
\item{rope}{lower and upper values for a region of practical equivalence.}
\item{values}{whether the points should be labeled with their values.}
\item{digits}{the specified number of decimal places.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}