% File man/plotData.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotData}
\alias{plotData}
\alias{plotData.default}
\alias{plotData.formula}
\title{Plot Data}
\description{Provides a plot of data points for each group or level mean.}

\usage{
\method{plotData}{default}(\dots,add=FALSE,main=NULL,ylab="Outcome",xlab="",offset=0,method="jitter",jitter=.08,col="gray30",pch=16)

\method{plotData}{formula}(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",offset=0,method="jitter",jitter=.08,col="gray30",pch=16)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{add}{whether the plot should added to the existing plot.}
\item{ylab}{a label for the y-axis.}
\item{xlab}{a label for the x-axis.}
\item{main}{a custom title for the graph.}
\item{ylim}{custom limits for the y axis.}
\item{offset}{a value indicating how offset the points should be.}
\item{method}{method for stacking or jittering the data.}
\item{jitter}{a value indicating how much jitter the data should have (if method is set to jitter)}
\item{col}{a value for the shaded color of the points.}
\item{pch}{a value indicating the symbol for the points.}
}