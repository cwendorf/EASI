% File man/estimateRegression.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{estimateRegression}
\title{Estimate Regression}
\description{Provides a table of the regression estimate and its intervals.}

\usage{
\method{estimateRegression}{default}(frame, y=NULL, value=NULL, conf.level=.95, main=NULL, digits=3)

\method{estimateRegression}{wss}(DescStats, CorrStats, y=NULL, value=NULL, conf.level=.95, main=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations for the data set}
\item{y}{the name of the criterion}
\item{value}{a specific regression value to display}
\item{conf.level}{confidence level of the interval}
\item{main}{a custom title for the table}
\item{digits}{the specified number of decimal places}
}

\value{
The returned list contains one frame with the following components:    
\item{Est}{the regression estimate}
\item{CI.LL}{the lower limit of the confidence interval for the regression estimate}
\item{CI.UL}{the upper limit of the confidence interval for the regression estimate}
\item{PI.LL}{the lower limit of the prediction interval for the regression estimate}
\item{PI.UL}{the upper limit of the prediction interval for the regression estimate}
}