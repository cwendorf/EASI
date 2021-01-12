% File man/describeRegressionEffect.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{describeRegressionEffect}
\alias{describeRegressionEffect}
\alias{describeRegressionEffect.default}
\alias{describeRegressionEffect.wss}
\title{Describe Regression Effect}
\description{Calculates R Squared.}

\usage{
\method{describeRegressionEffect}{default}(Predictors,Criterion,main=NULL,digits=3)

\method{describeRegressionEffect}{wss}(PredStats,CritStats,CorrStats,main=NULL,digits=3)
}

\arguments{
\item{Predictors}{a set of (non-empty) numeric vectors of data values for the predictors}
\item{Criterion}{a (non-empty) numeric vector of data values for the criterion}
\item{PredStats}{a matrix/frame of descriptive/summary statistics for the predictors}
\item{CritStats}{a matrix/frame of descriptive/summary statistics for the criterion}
\item{CorrStats}{a matrix/frame of correlations for the data set}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{Est}{the proportion of variance accounted for}
}