% File man/plotDifference.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotDifference}
\alias{plotDifference}
\alias{plotMeansDifference}
\title{Plot Difference}
\description{Provides a plot of the mean difference and its confidence interval.}

\usage{
\method{plotDifference}{data.frame}(frame, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotDifference}{formula}(formula, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotDifference}{wsm}(moments, corrs, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotDifference}{bsm}(moments, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{corrs}{a matrix/frame of correlations among the measures}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{mu}{a number indicating the true/hypothesized value of the mean difference}
\item{conf.level}{confidence level of the interval}
\item{rope}{lower and upper values for a region of practical equivalence}
\item{values}{whether the points should be labeled with their values}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
}

\details{
This function compares two groups or variables. As such, the supplied factor or table of summary statistics should contain only two groups or two variables.
}

\value{
The returned plot contains the following components:
\item{Diff}{the difference between the two means}
\item{LL}{the lower limit of the confidence interval for the difference}
\item{UL}{the upper limit of the confidence interval for the difference}
\item{mu}{a horizontal line for the true/hypothesized value}
\item{rope}{a shaded region of practical equivalence}
}