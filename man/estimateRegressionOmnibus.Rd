% File man/estimateRegressionOmnibus.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{estimateRegressionOmnibus}
\alias{estimateRegressionOmnibus}
\alias{estimateRegressionOmnibus.default}
\alias{estimateRegressionOmnibus.wss}
\title{Estimate Regression Omnibus}
\description{Calculates R Squared and its confidence interval.}

\usage{
\method{estimateRegressionOmnibus}{default}(Predictors,Criterion,conf.level=.95,main=NULL,digits=3)

\method{estimateRegressionOmnibus}{wss}(PredStats,CritStats,CorrStats,conf.level=.95,main=NULL,digits=3)
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
\item{Est}{the proportion of variance accounted for}
\item{LL}{the lower limit of the confidence interval for the proportion of variance accounted for}
\item{UL}{the upper limit of the confidence interval for the proportion of variance accounted for}
}