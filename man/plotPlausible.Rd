% File man/plotPlausible.Rd
% Part of the EASI package, https://github.com/cwendorf/EASI

\name{plotPlausible}
\alias{plotPlausible}
\alias{addPlausible}
\title{Plot Plausible}
\description{Provides a plausibility curve for each group or variable.}

\usage{
\method{plotPlausible}{data.frame}(frame, add=FALSE, main=NULL, ylab="Outcome", xlab="", ylim=NULL, type="right", offset=0, scale=1, col="black")

\method{plotPlausible}{formula}(formula, add=FALSE, main=NULL, ylab="Outcome", xlab="", ylim=NULL, type="right", offset=0, scale=1, col="black")
}

\arguments{
\item{frame}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{add}{whether the plot should added to the existing plot}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{type}{sides of the plot to be included}
\item{offset}{a value indicating the offset of the plot}
\item{scale}{a value that indicates the width of the plot}
\item{col}{a value for the shaded color of the plot}
}

\details{
`plotPlausible` can be used to initialize a new plot or add to an existing plot (using the `add` argument). `addPlausible` is identical to `plotPlausible` without the need to utilize the `add` argument.
}

\value{
The returned plot contains densities for the groups or variables.
}