% File man/plotScatter.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotScatter}
\alias{plotScatter}
\alias{plotScatter.default}
\title{Plot Scatter}
\description{Provides a scatterplot.}

\usage{
\method{plotScatter}{default}(\dots,add=FALSE,main=NULL,ylab="Outcome",xlab="",xlim=NULL,ylim=NULL,points=TRUE,col="black",pch=16)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{PredStats}{a matrix/frame of descriptive/summary statistics for the predictor}
\item{CritStats}{a matrix/frame of descriptive/summary statistics for the criterion}
\item{CorrStats}{a matrix/frame of correlations for the data set}
\item{add}{whether the plot should added to the existing plot}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{main}{a custom title for the graph}
\item{xlim}{custom limits for the x axis}
\item{ylim}{custom limits for the y axis}
\item{points}{whether the data points should be plotted}
\item{col}{a value for the shaded color of the points}
\item{pch}{a value indicating the symbol for the points}
}

\value{

The returned plot contains the scatterplot.}