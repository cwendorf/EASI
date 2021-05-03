% File man/plotRegression.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotRegression}
\alias{plotRegression}
\alias{plotRegression.default}
\alias{plotRegression.wss}
\title{Plot Regression}
\description{Provides a plot of the regression line and its intervals.}

\usage{
\method{plotRegression}{default}(Predictors,Criterion,line=TRUE,value=NULL,range=NULL,interval="both",conf.level=.95,main=NULL,xlim=NULL,ylim=NULL,points=TRUE,cross=FALSE,col="black",values=TRUE,digits=3,add=FALSE)

\method{plotRegression}{wss}(PredStats,CritStats,CorrStats,line=TRUE,value=NULL,range=NULL,interval="both",conf.level=.95,main=NULL,xlim=NULL,ylim=NULL,cross=FALSE,col="black",values=TRUE,digits=3,add=FALSE)
}

\arguments{
\item{Predictors}{a set of (non-empty) numeric vectors of data values for the predictors}
\item{Criterion}{a (non-empty) numeric vector of data values for the criterion}
\item{PredStats}{a matrix/frame of descriptive/summary statistics for the predictors}
\item{CritStats}{a matrix/frame of descriptive/summary statistics for the criterion}
\item{CorrStats}{a matrix/frame of correlations for the data set}
\item{line}{whether the regression line should be displayed}
\item{value}{a specific regression value to display}
\item{range}{the range of confidence and prediction intervals to display}
\item{interval}{the type of interval to display (none, confidence, prediction, both)}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the graph}
\item{xlim}{custom limits for the x axis}
\item{ylim}{custom limits for the y axis}
\item{points}{whether the scatterplot points should be displayed}
\item{cross}{whether a cross at the mean levels should be displayed}
\item{col}{color of the regression plot}
\item{values}{whether the intervals should be labeled with their values}
\item{digits}{the specified number of decimal places}
\item{add}{whether the plot should be added to an existing plot}
}

\value{
The returned plot contains the following components:
\item{Est}{the regression line}
\item{LL}{the lower limits of the intervals for the regression line}
\item{UL}{the upper limits of the intervals for the regression line}
}