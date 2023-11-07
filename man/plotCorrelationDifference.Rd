% File man/plotCorrelationDifference.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotCorrelationDifference}
\alias{plotCorrelationDifference}
\alias{plotCorrelationDifference.default}
\title{Plot Correlation Difference}
\description{Provides a plot of the confidence interval for a correlation difference for independent samples.}

\usage{
\method{plotCorrelationDifference}{default}(CorrEst1, CorrEst2, ylab="Outcome", xlab="", rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)
}

\arguments{
\item{CorrEst1}{a matrix/frame of the correlation and its confidence interval in the first group}
\item{CorrEst2}{a matrix/frame of the correlation and its confidence interval in the second group}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{rope}{lower and upper values for a region of practical equivalence}
\item{values}{whether the points should be labeled with their values}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
}

\value{
The returned plot contains the following components:
\item{Diff}{the difference between the two correlations}
\item{LL}{the lower limit of the confidence interval for the difference}
\item{UL}{the upper limit of the confidence interval for the difference}
\item{rope}{a shaded region of practical equivalence}
}