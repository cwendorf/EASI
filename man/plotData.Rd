% File man/plotData.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotData}
\alias{plotData}
\alias{addData}
\title{Plot Data}
\description{Provides a plot of data points for each group or level mean.}

\usage{
\method{plotData}{data.frame}(frame, add=FALSE, main=NULL, ylab="Outcome", xlab="", offset=.1, method="stack", jitter=.05, col=rgb(0, 0, 0, .3), pch=16)

\method{plotData}{formula}(formula, add=FALSE, main=NULL, ylab="Outcome", xlab="", offset=.1, method="stack", jitter=.05, col=rgb(0, 0, 0, .3), pch=16)
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{add}{whether the plot should added to the existing plot}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{offset}{a value indicating the offset of the points}
\item{method}{method for stacking or jittering the data}
\item{jitter}{a value indicating the amount of jitter (if method is set to jitter)}
\item{col}{a value for the shaded color of the points}
\item{pch}{a value indicating the symbol for the points}
}

\details{
`plotData` can be used to initialize a new plot or add to an existing plot (using the `add` argument). `addData` is identical to `plotData` without the need to utilize the `add` argument.
}

\value{
The returned plot contains the data for the groups or variables.
}