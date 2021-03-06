% File man/plotBoxes.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotBoxes}
\alias{plotBoxes}
\alias{plotBoxes.default}
\alias{plotBoxes.formula}
\title{Plot Boxes}
\description{Provides a boxplot for each group or variable.}

\usage{
\method{plotBoxes}{default}(\dots,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.8,border="black",col=rgb(0,0,0,0),values=TRUE)

\method{plotBoxes}{formula}(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.8,border="black",col=rgb(0,0,0,0),values=TRUE)
}

\arguments{
\item{\dots}{a set of (non-empty) numeric vectors of data values}
\item{formula}{a formula of the form \code{lhs ~ rhs} where \code{lhs} is a numeric variable giving the data values and \code{rhs} a factor giving the corresponding groups}
\item{DescStats}{a matrix/frame of descriptive/summary statistics}
\item{add}{whether the plot should added to the existing plot}
\item{ylab}{a label for the y-axis}
\item{xlab}{a label for the x-axis}
\item{main}{a custom title for the graph}
\item{ylim}{custom limits for the y axis}
\item{offset}{a value indicating the offset of the boxplot}
\item{scale}{a value that indicates the width of the boxplot}
\item{col}{a value for the shaded color of the boxplot}
\item{border}{a value for the border color of the boxplot}
\item{values}{whether the values should be added to the boxplot}
\item{digits}{the specified number of decimal places}
}

\value{
The returned plot contains the following components:
\item{LW}{the lower whisker}
\item{LH}{the lower hinge}
\item{Mdn}{the median value}
\item{UH}{the upper hinge}
\item{UW}{the upper whisker}
}