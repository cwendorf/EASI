% File man/plotMoments.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotMoments}
\alias{plotMoments}
\alias{addMoments}
\title{Plot Moments}
\description{Provides a plot of all group or level means and standard deviations.}

\usage{
\method{plotMoments}{default}(variable, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotMoments}{data.frame}(frame, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotMoments}{formula}(formula, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotMoments}{wsm}(moments, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotMoments}{bsm}(moments, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)
}

\arguments{
\item{variable}{a numeric vector of data values}
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{moments}{a matrix/frame of descriptive/summary statistics}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{values}{whether the points should be labeled with their values}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
}

\details{
`plotMoments` can be used to initialize a new plot or add to an existing plot (using the `add` argument). `addMoments` is identical to `plotMoments` without the need to utilize the `add` argument.
}

\value{
The returned plot contains the following components:
\item{N}{the number of individuals for the variables or groups}
\item{M}{the mean for the variables or groups}
\item{SD}{the standard deviation for the variables or groups}
}