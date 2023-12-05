% File man/plotSummary.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotSummary}
\alias{plotSummary}
\alias{addSummary}
\title{Plot Summary}
\description{Provides a plot of all group or level means and standard deviations.}

\usage{
\method{plotSummary}{default}(frame, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotSummary}{formula}(formula, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotSummary}{wss}(DescStats, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)

\method{plotSummary}{bss}(DescStats, ylab="Outcome", xlab="", values=TRUE, main=NULL, ylim=NULL, digits=3)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{values}{whether the points should be labeled with their values}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{digits}{the specified number of decimal places}
}

\details{
`plotSummary` can be used to initialize a new plot or add to an existing plot (using the `add` argument). `addSummary` is identical to `plotSummary` without the need to utilize the `add` argument.
}

\value{
The returned plot contains the following components:
\item{N}{the number of individuals for the variables or groups}
\item{M}{the mean for the variables or groups}
\item{SD}{the standard deviation for the variables or groups}
}