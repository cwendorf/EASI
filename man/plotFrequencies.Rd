% File man/plotFrequencies.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotFrequencies}
\alias{plotFrequencies}
\alias{addFrequencies}
\title{Plot Frequencies}
\description{Provides a frequency distribution for each group or variable.}

\usage{
\method{plotFrequencies}{default}(variable, add=FALSE, ylim=NULL, main=NULL, ylab=NULL, xlab="", type="right", offset=.1, col="black")

\method{plotFrequencies}{data.frame}(frame, add=FALSE, ylim=NULL, main=NULL, ylab=NULL, xlab="", type="right", offset=.1, col="black")

\method{plotFrequencies}{formula}(formula, add=FALSE, ylim=NULL, main=NULL, ylab=NULL, xlab="", type="right", offset=.1, col="black")
}

\arguments{
\item{variable}{a numeric vector of data values}
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{add}{whether the plot should added to the existing plot}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{type}{side on which the distribution should be displayed}
\item{offset}{a value indicating the offset of the plot}
\item{col}{a value for the shaded color of the plot}
}

\details{
`plotFrequencies` can be used to initialize a new plot or add to an existing plot (using the `add` argument). `addFrequencies` is identical to `plotFrequencies` without the need to utilize the `add` argument.
}

\value{
The returned plot contains frequency distributions for the groups or variables.
}