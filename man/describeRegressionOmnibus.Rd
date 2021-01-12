% File man/describeRegressionOmnibus.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{describeRegressionOmnibus}
\alias{describeRegressionOmnibus}
\alias{describeRegressionOmnibus.default}
\alias{describeRegressionOmnibus.wss}
\title{Describe Regression Omnibus}
\description{Provides a source table for the regression model.}

\usage{
\method{describeRegressionOmnibus}{default}(Predictors,Criterion,main=NULL,digits=3)

\method{describeRegressionOmnibus}{wss}(PredStats,CritStats,CorrStats,main=NULL,digits=3)
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
\item{SS}{the sum of Squares for the various sources}
\item{df}{the degrees of freedom for the various sources}
\item{MS}{the mean squares for the various sources}
}