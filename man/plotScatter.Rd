% File man/plotScatter.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotScatter}
\alias{plotScatter}
\alias{plotScatter.default}
\alias{plotScatter.wss}
\title{Plot Scatter}
\description{Provides a scatterplot and regression line.}

\usage{
\method{plotScatter}{default}(\dots,add=FALSE,main=NULL,ylab="Outcome",xlab="",xlim=NULL,ylim=NULL,points=TRUE,line=TRUE,col="black",pch=16)

\method{plotScatter}{wss}(PredStats,CritStats,CorrStats,main=NULL,ylab="Outcome",xlab="",xlim=NULL,ylim=NULL,points=FALSE,line=TRUE,col="black",pch=16)
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
\item{line}{whether the regression line should be plotted}
\item{col}{a value for the shaded color of the points}
\item{pch}{a value indicating the symbol for the points}
}

\value{

The returned plot contains the scatterplot and optional regression line.}