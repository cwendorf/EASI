% File man/estimateRegressionCoefficients.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateRegressionCoefficients}
\alias{estimateRegressionCoefficients}
\alias{estimateRegressionCoefficients.default}
\alias{estimateRegressionCoefficients.wss}
\title{Estimate Regression Coefficients}
\description{Provides a table of regression coefficients and their confidence intervals.}

\usage{
\method{estimateRegressionCoefficients}{default}(Predictors,Criterion,conf.level=.95,main=NULL,digits=3)

\method{estimateRegressionCoefficients}{wss}(PredStats,CritStats,CorrStats,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{Predictors}{a set of (non-empty) numeric vectors of data values for the predictors}
\item{Criterion}{a (non-empty) numeric vector of data values for the criterion}
\item{PredStats}{a matrix/frame of descriptive/summary statistics for the predictors}
\item{CritStats}{a matrix/frame of descriptive/summary statistics for the criterion}
\item{CorrStats}{a matrix/frame of correlations for the data set}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{Est}{the regression coefficients}
\item{SE}{the standard errors for the regression coefficients}
\item{df}{the degrees of freedom for the regression coefficients}
\item{LL}{the lower limits of the confidence intervals for the regression coefficients}
\item{UL}{the upper limits of the confidence intervals for the regression coefficients}
}