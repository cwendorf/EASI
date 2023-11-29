% File man/plotStandardizedRegressionCoefficients.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotStandardizedRegressionCoefficients}
\alias{plotStandardizedRegressionCoefficients}
\title{Plot Standardized Regression Coefficients}
\description{Provides a plot of the standardized regression coefficients and their confidence intervals.}

\usage{
\method{plotStandardizedRegressionCoefficients}{default}(frame, y=NULL, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotStandardizedRegressionCoefficients}{wss}(DescStats, CorrStats, y=NULL, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{CorrStats}{a matrix/frame of correlations for the data set}
\item{y}{the name of the criterion}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{mu}{a number indicating the true/hypothesized value of the mean}
\item{conf.level}{confidence level of the interval}
\item{line}{a number for a horizontal reference line}
\item{rope}{lower and upper values for a region of practical equivalence}
\item{values}{whether the points should be labeled with their values}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
}

\value{
The returned plot contains the following components:
\item{Est}{the standardized regression coefficients}
\item{LL}{the lower limits of the confidence intervals for the standardized regression coefficients}
\item{UL}{the upper limits of the confidence intervals for the standardized regression coefficients}
\item{mu}{a horizontal line for the true/hypothesized value}
\item{rope}{a shaded region of practical equivalence}
}