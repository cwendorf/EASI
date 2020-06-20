% File man/plotBoxes.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotBoxes}
\alias{plotBoxes}
\alias{plotBoxes.default}
\alias{plotBoxes.formula}
s\title{Plot Boxes}
\description{Provides a boxplot for each group or level mean.}

\usage{
\method{plotBoxes}{default}(\dots,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.6,border="black",col="white")

\method{plotBoxes}{formula}(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.6,border="black",col="white")
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values.}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups.}
\item{DescStats}{a matrix/frame of descriptive/summary statistics.}
\item{add}{whether the plot should added to the existing plot.}
\item{ylab}{a label for the y-axis.}
\item{xlab}{a label for the x-axis.}
\item{main}{a custom title for the graph.}
\item{ylim}{custom limits for the y axis.}
\item{offset}{a value indicating how offset the boxplot should be.}
\item{scale}{a value that indicates how wide the boxplot should be.}
\item{col}{a value for the shaded color of the boxplot.}
\item{border}{a value for the border color of the boxplot.}
}

\details{
Tutorials and examples from published work are available at \url{https://cwendorf.github.io/EASI/}
}