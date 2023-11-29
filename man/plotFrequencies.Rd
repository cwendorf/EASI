% File man/plotFrequencies.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotFrequencies}
\title{Plot Frequencies}
\description{Provides a frequency distribution for each group or variable.}

\usage{
\method{plotDensity}{default}(frame, add=FALSE, main=NULL, ylab="Outcome", xlab="", ylim=NULL, offset=.1, col=rgb(0, 0, 0, .1))

\method{plotDensity}{formula}(formula, add=FALSE, main=NULL, ylab="Outcome", xlab="", ylim=NULL, offset=.1, col=rgb(0, 0, 0, .1))
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{add}{whether the plot should added to the existing plot}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{offset}{a value indicating the offset of the plot}
\item{col}{a value for the shaded color of the plot}
}

\value{
The returned plot contains frequency distributions for the groups or variables.
}