% File man/describeRegressionEffect.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{describeRegressionEffect}
\alias{describeModel}
\title{Describe Regression Effect}
\description{Provides a source table for the regression model.}

\usage{
\method{describeRegressionEffect}{default}(frame, y=NULL, main=NULL, digits=3)

\method{describeRegressionEffect}{wss}(DescStats, CorrStats, y=NULL, main=NULL, digits=3)
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
\item{SS}{the sum of Squares for the various sources}
\item{df}{the degrees of freedom for the various sources}
\item{MS}{the mean squares for the various sources}
}