% File man/estimateRegressionEffect.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateRegressionEffect}
\alias{estimateRegressionEffect}
\alias{estimateRegressionEffect.default}
\alias{estimateRegressionEffect.wss}
\title{Estimate Regression Effect}
\description{Calculates R Squared and its confidence interval.}

\usage{
\method{estimateRegressionEffect}{default}(frame, y=NULL, conf.level=.95, main=NULL, digits=3)

\method{estimateRegressionEffect}{wss}(DescStats, CorrStats, y=NULL, conf.level=.95, main=NULL, digits=3)
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
\item{Est}{the proportion of variance accounted for}
\item{LL}{the lower limit of the confidence interval for the proportion of variance accounted for}
\item{UL}{the upper limit of the confidence interval for the proportion of variance accounted for}
}