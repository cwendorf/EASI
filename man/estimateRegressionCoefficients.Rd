% File man/estimateRegressionCoefficients.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateRegressionCoefficients}
\alias{estimateRegressionCoefficients}
\alias{estimateRegressionCoefficients.default}
\alias{estimateRegressionCoefficients.wss}
\title{Estimate Regression Coefficients}
\description{Provides a table of regression coefficients and their confidence intervals.}

\usage{
\method{estimateRegressionCoefficients}{default}(frame,y=NULL,conf.level=.95,main=NULL,digits=3)

\method{estimateRegressionCoefficients}{wss}(DescStats,CorrStats,y=NULL,conf.level=.95,main=NULL,digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations for the data set}
\item{y}{the name of the criterion}
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