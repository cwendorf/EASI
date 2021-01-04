% File man/plotViolins.Rd
% Part of the EASI package, https://cwendorf.github.io/EASI

\name{plotViolins}
\alias{plotViolins}
\alias{plotViolins.default}
\alias{plotViolins.formula}
\title{Plot Violins}
\description{Provides a violin plot for each group or variable.}

\usage{
\method{plotViolins}{default}(\dots,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.6,border="gray75",col="gray90")

\method{plotViolins}{formula}(formula,add=FALSE,main=NULL,ylab="Outcome",xlab="",ylim=NULL,offset=0,scale=.6,border="gray75",col="gray90")
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
\item{offset}{a value indicating the offset of the violin}
\item{scale}{a value that indicates the width of the violin}
\item{col}{a value for the shaded color of the violin}
\item{border}{a value for the border color of the violin}
}

\value{
The returned plot contain distributions for the groups or variables.
}