% File man/testRegressionModel.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testRegressionModel}
\alias{testRegressionModel}
\alias{testModel}
\title{Test Regression Model}
\description{Provides a statistical significance test for a regression model.}

\usage{
\method{testRegressionModel}{default}(frame, y=NULL, main=NULL, digits=3)

\method{testRegressionModel}{wss}(DescStats, CorrStats, y=NULL, main=NULL, digits=3)
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
\item{F}{the F value for the regression model}
\item{df1}{the degrees of freedom for the regression model}
\item{df2}{the degrees of freedom for the error term}
\item{p}{the p value for the regression model}
}