% File man/estimateRegression.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateRegression}
\alias{estimateRegression}
\alias{estimateRegression.default}
\alias{estimateRegression.wss}
\title{Estimate Regression}
\description{Provides a table of the regression estimate and its intervals.}

\usage{
\method{estimateRegression}{default}(Predictors,Criterion,value=NULL,conf.level=.95,main=NULL,digits=3)

\method{estimateRegression}{wss}(PredStats,CritStats,CorrStats,value=NULL,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{Predictors}{a set of (non-empty) numeric vectors of data values for the predictors}
\item{Criterion}{a (non-empty) numeric vector of data values for the criterion}
\item{PredStats}{a matrix/frame of descriptive/summary statistics for the predictors}
\item{CritStats}{a matrix/frame of descriptive/summary statistics for the criterion}
\item{CorrStats}{a matrix/frame of correlations for the data set}
\item{value}{a specific regression value to display}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{Est}{the regression estimate}
\item{CI.LL}{the lower limit of the confidence interval for the regression estimate}
\item{CI.UL}{the upper limit of the confidence interval for the regression estimate}
\item{PI.LL}{the lower limit of the prediction interval for the regression estimate}
\item{PI.UL}{the upper limit of the prediction interval for the regression estimate}
}