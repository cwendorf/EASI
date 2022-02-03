% File man/describeRegressionEffect.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeRegressionEffect}
\alias{describeRegressionEffect}
\alias{describeRegressionEffect.default}
\alias{describeRegressionEffect.wss}
\title{Describe Regression Effect}
\description{Calculates fit indices for the regression model.}

\usage{
\method{describeRegressionEffect}{default}(frame,y=NULL,main=NULL,digits=3)

\method{describeRegressionEffect}{wss}(DescStats,CorrStats,y=NULL,main=NULL,digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations for the data set}
\item{y}{the name of the criterion}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:
\item{R}{the multiple correlation for the model}   
\item{RSq}{R Squared for the model}
\item{AdjRSq}{Adjusted R Squared for the model}
}