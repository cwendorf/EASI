% File man/testRegressionOmnibus.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{testRegressionOmnibus}
\alias{testRegressionOmnibus}
\alias{testRegressionOmnibus.default}
\alias{testRegressionOmnibus.wss}
\title{Test Regression Omnibus}
\description{Provides a statistical significance test for a regression model.}

\usage{
\method{testRegressionOmnibus}{default}(Predictors,Criterion,main=NULL,digits=3)

\method{testRegressionOmnibus}{wss}(PredStats,CritStats,CorrStats,main=NULL,digits=3)
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
\item{F}{the F value for the regression model}
\item{df1}{the degrees of freedom for the regression model}
\item{df2}{the degrees of freedom for the error term}
\item{p}{the p value for the regression model}
}