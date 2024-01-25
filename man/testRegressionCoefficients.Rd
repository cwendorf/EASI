% File man/testRegressionCoefficients.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{testRegressionCoefficients}
\alias{testRegressionCoefficients}
\alias{testCoefficients}
\title{Test Regression Coefficients}
\description{Provides statistical significance tests for the regression coefficients.}

\usage{
\method{testRegressionCoefficients}{default}(frame, y=NULL, main=NULL, digits=3)

\method{testRegressionCoefficients}{wss}(DescStats, CorrStats, y=NULL, main=NULL, digits=3)
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
\item{Est}{the regression coefficients}
\item{SE}{the standard errors for the regression coefficients}
\item{df}{the degrees of freedom for the regression coefficients}
\item{t}{the t values for the regression coefficients}
\item{p}{the p values for the regression coefficients}
}