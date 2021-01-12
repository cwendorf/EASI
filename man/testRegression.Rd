% File man/testRegression.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{testRegression}
\alias{testRegression}
\alias{testRegression.default}
\alias{testRegression.wss}
\title{Test Regression}
\description{Provides statistical significance tests for the regression coefficients.}

\usage{
\method{testRegression}{default}(Predictors,Criterion,main=NULL,digits=3)

\method{testRegression}{wss}(PredStats,CritStats,CorrStats,mu=0,ain=NULL,digits=3)
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
\item{Est}{the regression coefficients}
\item{SE}{the standard errors for the regression coefficients}
\item{df}{the degrees of freedom for the regression coefficients}
\item{t}{the t values for the regression coefficients}
\item{p}{the p values for the regression coefficients}
}