% File man/plotMeans.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotMeans}
\alias{plotMeans}
\alias{plotMeansSet}
\alias{addMeans}
\title{Plot Means}
\description{Provides a plot of all group or level means and their confidence intervals.}

\usage{
\method{plotMeans}{default}(variable, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotMeans}{data.frame}(frame, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotMeans}{formula}(formula, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotMeans}{wsm}(moments, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotMeans}{bsm}(moments, ylab="Outcome", xlab="", mu=0, conf.level=.95, rope=NULL, values=TRUE, main=NULL, ylim=NULL, digits=3)
}

\arguments{
\item{variable}{a numeric vector of data values}
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
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

\details{
`plotMeans` can be used to initialize a new plot or add to an existing plot (using the `add` argument). `addMeans` is identical to `plotMeans` without the need to utilize the `add` argument.
}

\value{
The returned plot contains the following components:
\item{M}{the means for the variables or groups}
\item{LL}{the lower limits of the confidence intervals of the means}
\item{UL}{the upper limits of the confidence intervals of the means}
\item{mu}{a horizontal line for the true/hypothesized value}
\item{rope}{a shaded region of practical equivalence}
}